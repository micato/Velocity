#include "isodialog.h"
#include "ui_isodialog.h"

ISODialog::ISODialog(ISO *iso, QWidget *parent) :
    QDialog(parent), ui(new Ui::ISODialog), iso(iso)
{
    ui->setupUi(this);

    LoadFileListing();

    ui->treeWidget->setColumnWidth(0, 300);

    ui->treeWidget->setContextMenuPolicy(Qt::CustomContextMenu);
    connect(ui->treeWidget, SIGNAL(customContextMenuRequested(QPoint)), this, SLOT(showContextMenu(QPoint)));
}

ISODialog::~ISODialog()
{
    delete ui;
    delete iso;
}

void ISODialog::LoadFileListing()
{
    iso->GetFileListing();
    LoadDirectory(ui->treeWidget, iso->root, true);
}

void ISODialog::LoadDirectory(QObject *parent, std::vector<GdfxFileEntry> directoryContents, bool root)
{
    // create a tree widget for all the items, and recursively call for directories
    for (size_t i = 0; i < directoryContents.size(); i++)
    {
        GdfxFileEntry curEntry = directoryContents.at(i);

        // it's necessary to differentiate the parent type
        QTreeWidgetItem *item;
        if (root)
            item = new QTreeWidgetItem((QTreeWidget*)parent);
        else
            item = new QTreeWidgetItem((QTreeWidgetItem*)parent);

        UINT64 fileAddress = iso->SectorToAddress(curEntry.sector);

        item->setText(0, QString::fromStdString(curEntry.name));
        item->setText(1, QtHelpers::ToHexString(fileAddress));
        item->setText(2, QtHelpers::ToHexString(curEntry.sector));
        item->setText(3, QString::fromStdString(ByteSizeToString(curEntry.size)));

        QString pathInISO = QString::fromStdString(curEntry.filePath + curEntry.name);
        item->setData(0, Qt::UserRole, pathInISO);

        if (curEntry.attributes & GdfxDirectory)
            LoadDirectory((QObject*)item, curEntry.files);
    }
}

void ISODialog::on_pushButton_clicked()
{
    QString outDirectory = QFileDialog::getExistingDirectory(this, "Choose a location to extract the files to", QtHelpers::DesktopLocation());
    if (outDirectory.isEmpty())
        return;

    SingleProgressDialog *dialog;
    try
    {
        dialog = new SingleProgressDialog(FileSystemISO, iso, OpExtractAll, "", outDirectory, NULL, this);
        dialog->setModal(true);
        dialog->show();
        dialog->start();
    }
    catch (std::string error)
    {
        QMessageBox::critical(this, "Extract All Error", "An error occurred while extracting all the files.\n\n" + QString::fromStdString(error));
        dialog->close();
    }
}

void ISODialog::showContextMenu(QPoint point)
{
    QPoint globalPos = ui->treeWidget->mapToGlobal(point);
    QMenu contextMenu;

    if (ui->treeWidget->selectedItems().size() != 0)
        contextMenu.addAction(QPixmap(":/Images/extract.png"), "Extract");

    QAction *selectedItem = contextMenu.exec(globalPos);
    if (selectedItem == NULL)
        return;

    if (selectedItem->text() == "Extract")
    {
        QTreeWidgetItem *selectedItem = ui->treeWidget->selectedItems().at(0);
        QString pathInISO = selectedItem->data(0, Qt::UserRole).toString();

        QString outDirectory = QFileDialog::getExistingDirectory(this, "Choose a place to extract the file to", QtHelpers::DesktopLocation());
        iso->ExtractFile(outDirectory.toStdString(), pathInISO.toStdString());
    }
}
