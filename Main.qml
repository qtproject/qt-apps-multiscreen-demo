/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/


import QtQuick 2.1
import QtQuick.Window 2.3
import QtApplicationManager 1.0
import com.pelagicore.ScreenManager 1.0
import utils 1.0
import "Cluster/qml"
import "CenterConsole"
import "CenterConsole/sysui/StatusBar"
import "CenterConsole/sysui/BottomBar"
import "CenterConsole/sysui"

Rectangle {
    id: root

    property var cluster
    property bool showClusterIfPossible: ApplicationManager.systemProperties.showCluster

    Item {
        id: centerConsole
        width: Style.screenWidth
        height: Style.screenHeight
        rotation: -90
        y: -420
        x: 420

        Component {
            id: topMenu
            CenterScreen {
            }
        }

        StatusBar {
            id: statusBar
            anchors.left: parent.left
            anchors.right: parent.right
        }

        LaunchController {
            id: launcher
            anchors.top: statusBar.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height: centerConsole.height - statusBar.height - Style.bottomBarHeight
            width: parent.width
            initialItem: topMenu
        }
        BottomBar {
            id: climateBar
            anchors.bottom: parent.bottom
        }
    }

    Component{
        id: clusterComponent
        Window {
            id: cluster
            title: "Cluster Display"
            height: 720
            width: 1920
            visible: false
            screen: Qt.application.screens[1]

            color: "black"

            DashboardFrame {}

            Component.onCompleted: {
                WindowManager.registerCompositorView(cluster)
                cluster.show()
            }
        }
    }

    Component.onCompleted: {
        var canDisplayCluster = WindowManager.runningOnDesktop || ScreenManager.screenCount() > 1

        if (!showClusterIfPossible) {
            console.log("Showing Instrument Cluster was disabled");
            return
        }

        if (canDisplayCluster) {
            console.log("Showing Instrument Cluster");
            cluster = clusterComponent.createObject(root);
        } else {
            console.log("Showing the Instrument Cluster is not possible on this platform");
        }
    }

}
