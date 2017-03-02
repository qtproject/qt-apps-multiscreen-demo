#!/bin/sh
export QT_QPA_EGLFS_KMS_CONFIG=kms_config.json
cd /opt/automotivedemo
/usr/bin/appcontroller /usr/bin/appman -r -c /opt/am/config.yaml -c am-config.yaml --dbus none Main.qml

