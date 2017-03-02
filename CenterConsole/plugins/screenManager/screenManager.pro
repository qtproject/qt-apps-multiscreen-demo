include (../../../deployment.pri)
TEMPLATE = lib
TARGET  = screenmanagerplugin
QT += qml quick
CONFIG += qt plugin c++11

TARGET = $$qtLibraryTarget($$TARGET)
uri = com.pelagicore.ScreenManager

SOURCES += \
    plugin.cpp \
    screenmanager.cpp \

HEADERS += \
    screenmanager.h \

OTHER_FILES = qmldir

qmldir.files = qmldir

qmldir.path = $$TARGET_PATH/qml/$$replace(uri, \\., /)
target.path = $$TARGET_PATH/qml/$$replace(uri, \\., /)
INSTALLS += target qmldir
