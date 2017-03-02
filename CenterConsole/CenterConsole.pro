include (../deployment.pri)
TEMPLATE = subdirs

SUBDIRS = plugins

qml.files = apps sysui
qml.path = $$TARGET_PATH_CONSOLE

INSTALLS += qml

