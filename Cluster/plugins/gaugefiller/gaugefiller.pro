include (../../../deployment.pri)
TEMPLATE = lib
TARGET  = clustergaugefillerplugin
QT += qml quick
CONFIG += qt plugin c++11

TARGET = $$qtLibraryTarget($$TARGET)
uri = com.qtcompany.clustergaugefiller

SOURCES += \
    plugin.cpp \
    gauge.cpp \
    gaugenode.cpp

HEADERS += \
    gauge.h

OTHER_FILES = qmldir

qmldir.files = qmldir
qmldir.path = $$TARGET_PATH/qml/$$replace(uri, \\., /)
target.path = $$TARGET_PATH/qml/$$replace(uri, \\., /)
INSTALLS += target qmldir
