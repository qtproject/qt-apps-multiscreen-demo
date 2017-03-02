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
import service.valuesource 1.0
import com.qtcompany.clustergaugefiller 1.0

Item {
    anchors.fill: parent

    property real tachometerNeedleRotation: 0.0
    property string rpm: actualRPM.toFixed().toString()
    property real actualRPM: startupAnimationsFinished
                             ? ValueSource.rpm : -tachometerNeedleRotation
    property real minValueAngle: 55
    property real maxValueAngle: 255
    property real minimumRPM: 0
    property real maximumRPM: 8000

    Item {
        anchors.right: parent.right
        anchors.rightMargin: 30
        width: 720
        height: 720

        GaugeFiller {
            id: rpmFiller
            value: actualRPM
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 369
            anchors.rightMargin: 380
            radius: 232
            fillWidth: 8
            color: "#EF2973"
            opacity: 0.6
            minAngle: minValueAngle
            maxAngle: maxValueAngle
            minValue: minimumRPM
            maxValue: maximumRPM
        }
    }

    Item {
        id: tachometerNeedle
        width: 468
        height: 10
        rotation: rpmFiller.angle - 35
        x: 1275
        y: 363

        Image {
            opacity: 0.75
            width: 147
            anchors.left: parent.left
            anchors.leftMargin: 2
            anchors.verticalCenter: parent.verticalCenter
            source: "../../images/SpeedometerNeedle.png"
        }
    }

    Text {
        id: textEco
        anchors.top: tachometerNeedle.top
        anchors.topMargin: -10
        anchors.horizontalCenter: tachometerNeedle.horizontalCenter
        text: actualRPM > 4000 ? "POWER" : "ECO"
        font.pixelSize: 24
        color: actualRPM <= 4000 ? "white" : "red"
    }
}
