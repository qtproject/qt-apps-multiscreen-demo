include (../../../deployment.pri)
TEMPLATE = lib
TARGET  = clusterscenehelperplugin
QT += qml quick 3dcore 3dextras 3drender 3dquick 3dquick-private
CONFIG += qt plugin c++11

TARGET = $$qtLibraryTarget($$TARGET)
uri = com.qtcompany.clusterscenehelper

SOURCES += \
    plugin.cpp \
    scenehelper.cpp

HEADERS += \
    scenehelper.h

OTHER_FILES = qmldir

qmldir.files = qmldir
qmldir.path = $$TARGET_PATH/qml/$$replace(uri, \\., /)
target.path = $$TARGET_PATH/qml/$$replace(uri, \\., /)
INSTALLS += target qmldir
