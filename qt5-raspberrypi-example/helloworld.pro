TEMPLATE = app

target.path = /home/pi/helloworld
TARGET = helloworld
INSTALLS += target

DEPENDPATH += .
INCLUDEPATH += .

QT += quick

SOURCES += main.cpp
INCLUDEPATH += /mnt/rasp-pi-rootfs/usr/local/qt5pi/include/
qml_folder.source = qml
DEPLOYMENTFOLDERS = qml_folder

OTHER_FILES += \
    qml/*

for(deploymentfolder, DEPLOYMENTFOLDERS) {
    item = item$${deploymentfolder}
    itemsources = $${item}.sources
    $$itemsources = $$eval($${deploymentfolder}.source)
    itempath = $${item}.path
    $$itempath= $$eval($${deploymentfolder}.target)
    export($$itemsources)
    export($$itempath)
    DEPLOYMENT += $$item
}

installPrefix = /home/pi/$${TARGET}

for(deploymentfolder, DEPLOYMENTFOLDERS) {
    item = item$${deploymentfolder}
    itemfiles = $${item}.files
    $$itemfiles = $$eval($${deploymentfolder}.source)
    itempath = $${item}.path
    $$itempath = $${installPrefix}/$$eval($${deploymentfolder}.target)
    export($$itemfiles)
    export($$itempath)
    INSTALLS += $$item
}
