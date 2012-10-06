#-------------------------------------------------
#
# Project created by QtCreator 2012-08-14T18:07:11
#
#-------------------------------------------------

QT       += core gui network xml phonon

TARGET = Velocity
TEMPLATE = app

include(Stfs/Botan.pri)
INCLUDEPATH += "C:/botan/include"
LIBS += "C:/botan/libBotan.a"

UI_DIR = ..\Velocity

SOURCES += main.cpp \
    mainwindow.cpp \
    packageviewer.cpp \
    profileeditor.cpp \
    about.cpp \
    Stfs/StfsMetaData.cpp \
    FileIO.cpp \
    GPD/XDBF.cpp \
    GPD/GPDBase.cpp \
    GPD/GameGPD.cpp \
    GPD/AvatarAwardGPD.cpp \
    AvatarAsset/AvatarAsset.cpp \
    AvatarAsset/AssetHelpers.cpp \
    Stfs/StfsDefinitions.cpp \
    metadata.cpp \
    certificatedialog.cpp \
    qthelpers.cpp \
    volumedescriptordialog.cpp \
    licensingdatadialog.cpp \
    transferflagsdialog.cpp \
    xdbfdialog.cpp \
    strbdialog.cpp \
    imagedialog.cpp \
    Account/AccountHelpers.cpp \
    Account/Account.cpp \
    GPD/XDBFHelpers.cpp \
    GPD/DashboardGPD.cpp \
    Stfs/StfsPackage.cpp \
    renamedialog.cpp \
    creationwizard.cpp \
    achievementcreationwizard.cpp \
    propertiesdialog.cpp \
    addressconverterdialog.cpp \
    stfstoolsdialog.cpp \
    progressdialog.cpp \
    stfsworkerthread.cpp \
    singleprogressdialog.cpp \
    profilecreatorwizard.cpp \
    themecreationwizard.cpp \
    gameadderdialog.cpp \
    avatarassetdownloader.cpp \
    gpddownloader.cpp \
    titleidfinder.cpp \
    titleidfinderdialog.cpp \
    gamerpicturepackdialog.cpp \
    gamerpicturedownloader.cpp

HEADERS  += mainwindow.h \
    packageviewer.h \
    profileeditor.h \
    about.h \
    Stfs/StfsMetaData.h \
    Stfs/StfsConstants.h \
    Stfs/FileIO.h \
    FileIO.h \
    GPD/XDBFDefininitions.h \
    GPD/XDBF.h \
    GPD/GPDBase.h \
    GPD/GameGPD.h \
    GPD/AvatarAwardGPD.h \
    winnames.h \
    AvatarAsset/AvatarAssetDefinintions.h \
    AvatarAsset/AvatarAsset.h \
    AvatarAsset/AssetHelpers.h \
    Stfs/StfsDefinitions.h \
    metadata.h \
    certificatedialog.h \
    qthelpers.h \
    volumedescriptordialog.h \
    licensingdatadialog.h \
    transferflagsdialog.h \
    xdbfdialog.h \
    strbdialog.h \
    imagedialog.h \
    Account/AccountHelpers.h \
    Account/AccountDefinitions.h \
    Account/Account.h \
    GPD/XDBFHelpers.h \
    GPD/DashboardGPD.h \
    Stfs/StfsPackage.h \
    renamedialog.h \
    achievementcreationwizard.h \
    creationwizard.h \
    propertiesdialog.h \
    addressconverterdialog.h \
    stfstoolsdialog.h \
    progressdialog.h \
    stfsworkerthread.h \
    singleprogressdialog.h \
    PluginInterfaces/igamemodder.h \
    profilecreatorwizard.h \
    themecreationwizard.h \
    gameadderdialog.h \
    avatarassetdownloader.h \
    gpddownloader.h \
    titleidfinder.h \
    titleidfinderdialog.h \
    gamerpicturepackdialog.h \
    gamerpicturedownloader.h

FORMS    += mainwindow.ui \
    packageviewer.ui \
    profileeditor.ui \
    about.ui \
    metadata.ui \
    certificatedialog.ui \
    volumedescriptordialog.ui \
    licensingdatadialog.ui \
    transferflagsdialog.ui \
    xdbfdialog.ui \
    strbdialog.ui \
    imagedialog.ui \
    renamedialog.ui \
    creationwizard.ui \
    achievementcreationwizard.ui \
    propertiesdialog.ui \
    addressconverterdialog.ui \
    stfstoolsdialog.ui \
    progressdialog.ui \
    singleprogressdialog.ui \
    profilecreatorwizard.ui \
    themecreationwizard.ui \
    gameadderdialog.ui \
    titleidfinderdialog.ui \
    gamerpicturepackdialog.ui

RESOURCES += \
    Resources.qrc
