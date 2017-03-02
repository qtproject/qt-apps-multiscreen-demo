/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt multiscreen demo application.
**
** $QT_BEGIN_LICENSE:GPL-EXCEPT$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 as published by the Free Software
** Foundation with exceptions as appearing in the file LICENSE.GPL3-EXCEPT
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.7
import Qt3D.Core 2.0

Item {
    id: root
    width: 1920
    height: 1080//720
    anchors.top: parent.top

    property real faderOpacity: 1.0

    Loader {
        id: welcomeLoader
        source: "DashboardView.qml"
        width: root.width
        height: 720//root.height
        onLoaded: {
            initialFade.start()
        }
    }

    property bool welcomeReady: welcomeLoader.status === Loader.Ready && welcomeLoader.item.isReady

    onWelcomeReadyChanged: {
        faderAnimation.start()
    }

    Loader {
        id: dashLoader
        source: "DashboardView.qml"
        visible: false
        active: true
        width: root.width
        height: 720//root.height
    }

    Rectangle {
        id: fader
        color: "black"
        anchors.fill: root
        opacity: faderOpacity
    }

    PropertyAnimation {
        id: initialFade
        target: root
        property: "faderOpacity"
        from: 1.0
        to: 0.0
        duration: 1000
    }

    SequentialAnimation {
        id: faderAnimation
        running: false

        PropertyAnimation {
            target: root
            property: "faderOpacity"
            from: 0.0
            to: 1.0
            duration: 500
        }
        ScriptAction {
            script: {
                welcomeLoader.visible = false
                dashLoader.visible = true
            }
        }
        PropertyAnimation {
            target: root
            property: "faderOpacity"
            from: 1.0
            to: 0.0
            duration: 500
        }
    }

    // Note: Use if cluster is displayed on 1080p screen
    Rectangle {
        color: "black"
        anchors.bottom: parent.bottom
        height: 360
        width: 1920

        Image {
            source: "../images/Built_with_Qt_RGB_logo_white.png"
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.margins: 30
        }
    }
}
