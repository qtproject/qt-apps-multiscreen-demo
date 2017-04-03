include (../../../deployment.pri)
TEMPLATE = lib
TARGET = qmldatasources
QT += qml quick sql
CONFIG += qt plugin

QMAKE_RPATHDIR += "$$INSTALL_PREFIX/long_padding/long_padding"

TARGET = $$qtLibraryTarget($$TARGET)
uri = com.pelagicore.datasource

# Input
SOURCES += \
    sqlquerydatasource.cpp \
    plugin.cpp \
    sqlquerymodel.cpp \
    sqltablemodel.cpp \
    sqltabledatasource.cpp

HEADERS += \
    sqlquerydatasource.h \
    plugin.h \
    sqlquerymodel.h \
    sqltablemodel.h \
    sqltabledatasource.h

OTHER_FILES = qmldir

qmldir.files = qmldir
qmldir.path = $$TARGET_PATH/qml/$$replace(uri, \\., /)
target.path = $$TARGET_PATH/qml/$$replace(uri, \\., /)
INSTALLS += target qmldir
