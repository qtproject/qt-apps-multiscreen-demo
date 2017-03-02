include (deployment.pri)
TEMPLATE = subdirs

SUBDIRS = \
        CenterConsole \
        Cluster

qml.files = imports kms_config.json Main.qml am-config.yaml start.sh
qml.path = $$TARGET_PATH

fonts.files = demo-assets/fonts/Lato-Bold.ttf \
              demo-assets/fonts/Lato-Light.ttf \
              demo-assets/fonts/Lato-Regular.ttf \
              demo-assets/fonts/Lato-Semibold.ttf
fonts.path = $$TARGET_PATH/imports/shared/assets/fonts

INSTALLS += qml fonts
