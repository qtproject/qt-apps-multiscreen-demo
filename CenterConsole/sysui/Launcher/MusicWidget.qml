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

import QtQuick 2.1

import QtApplicationManager 1.0
import controls 1.0
import utils 1.0
import controls 1.0

LaunchItemBackground {
    id: root
    applicationName: "com.pelagicore.media"
    Label {
        id: title
        z: 1
        text: "Music & TV"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: Style.paddingXXL
    }

    Image {
        id: image
        anchors.fill: root
        asynchronous: true
        source: musicControl.currentTrack ? musicControl.currentCover : ""
    }
    Image {
        source: Style.symbol("MusicOverlayGradient")
        anchors.bottom: parent.bottom
    }

    ApplicationIPCInterface {
        id: musicControl

        property var currentTrack
        property string currentCover: ""

        property string currentTime: "00:00"
        property string durationTime: "00:00"
        property bool playing: false

        signal previousTrack()
        signal nextTrack()
        signal play()
        signal pause()

        Component.onCompleted: {
            ApplicationIPCManager.registerInterface(musicControl, "com.pelagicore.music.control",
                                                    {})
        }
    }

    Behavior on scale {
        NumberAnimation {}
    }

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Style.padding
        width: parent.width
        spacing: Style.padding

        Label {
            width: parent.width - 20
            anchors.horizontalCenter: parent.horizontalCenter
            maximumLineCount: 2
            text: musicControl.currentTrack ? musicControl.currentTrack.title : ""
            font.pixelSize: Style.fontSizeL
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
        }

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: musicControl.currentTrack
                  ? qsTr('%1 / %2').arg(musicControl.currentTrack.artist).arg(musicControl.currentTrack.album)
                  : ""
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
        }
    }

    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 120
        spacing: 90
        Tool {
            name: "video-previous"
            vspan: 2
            onClicked: musicControl.previousTrack()
        }
        Tool {
            vspan: 2
            name: active ? "video-pause" : "video-play"
            onClicked: active ? musicControl.pause() : musicControl.play()
            active: musicControl.playing
        }
        Tool {
            vspan: 2
            name: "video-next"
            onClicked: musicControl.nextTrack()
        }
    }
}
