include (../../../deployment.pri)
TEMPLATE = lib
TARGET  = clusterdatasourceplugin
QT += qml quick
CONFIG += qt plugin c++11

QMAKE_RPATHDIR += "$$INSTALL_PREFIX/long_padding/long_padding"

TARGET = clusterdatasourceplugin
uri = com.qtcompany.clusterdemodata

SOURCES += \
    plugin.cpp \
    qtiviclusterdata.cpp \
    clusterdatabackend.cpp

HEADERS += \
    qtiviclusterdata.h \
    clusterdatabackend.h

#qtHaveModule(serialbus):!simulation_only {
#QT += serialbus
#} else: {
DEFINES += CLUSTERDATA_SIMULATION
#}

OTHER_FILES = qmldir

qmldir.files = qmldir

qmldir.path = $$TARGET_PATH/qml/$$replace(uri, \\., /)
target.path = $$TARGET_PATH/qml/$$replace(uri, \\., /)
INSTALLS += target qmldir
