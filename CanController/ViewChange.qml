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

import QtQuick 2.0

Rectangle{
    id: viewButton
    height: 60
    radius: 5
    border.width: 2
    color: pressed ? blinkColor : "white"

    property alias text: buttonText.text
    property bool mainView: true
    property bool pressed: false
    property bool optionalIcons: false

    property color blinkColor: "#26282a"
    property color textBlinkColor: "#d6d6d6"

    property url iconOn: optionalIcons ? "qrc:/CenterViewOnOpt.png" : "qrc:/CenterViewOn.png"
    property url iconOff: optionalIcons ? "qrc:/CenterViewOffOpt.png" : "qrc:/CenterViewOff.png"

    onPressedChanged: {
        // TODO: Hack, use oilTemp/oilPressure CAN messages for view change
        if (mainView)
            clusterDataControl.oilTemp = pressed ? 10 : 0
        else
            clusterDataControl.oilPressure = pressed ? 10 : 0
    }

    MouseArea {
        id: buttonMouse
        anchors.fill: parent
        onPressed: {
            buttonText.color = textBlinkColor
            viewButton.pressed = !viewButton.pressed
        }
        onReleased: {
            buttonText.color = blinkColor
            viewButton.pressed = !viewButton.pressed
        }
    }

    Column {
        spacing: 10

        anchors.centerIn: parent
        Image {
            source: viewButton.pressed ? iconOff : iconOn
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            id: buttonText
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 14
            color: "#26282a"
        }
    }
}
