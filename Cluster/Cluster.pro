include (../deployment.pri)
TEMPLATE = subdirs

SUBDIRS = plugins

qml.files = qml images
qml.path = $$TARGET_PATH_CLUSTER
INSTALLS += qml
