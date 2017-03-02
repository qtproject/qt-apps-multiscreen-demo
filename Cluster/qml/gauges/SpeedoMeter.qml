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

    property real speedometerNeedleRotation: 0.0
    property string speed: actualSpeed.toFixed().toString()
    property real actualSpeed: startupAnimationsFinished
                               ? ValueSource.kph : -speedometerNeedleRotation
    property real maxValueAngle: 305
    property real minValueAngle: 55
    property real minimumSpeed: 0
    property real maximumSpeed: 200

    Item {
        anchors.left: parent.left
        anchors.leftMargin: 30
        width: 720
        height: 720

        GaugeFiller {
            id: speedFiller
            value: actualSpeed
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 366
            anchors.leftMargin: 382
            radius: 232
            fillWidth: 8
            color: "#EF2973"
            opacity: 0.6
            maxAngle: maxValueAngle
            minAngle: minValueAngle
            minValue: minimumSpeed
            maxValue: maximumSpeed
        }
    }

    Item {
        id: speedometerNeedle
        width: 464
        height: 10
        rotation: speedFiller.angle - 35
        x: 180
        y: 361

        Image {
            opacity: 0.75
            width: 146
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            source: "../../images/SpeedometerNeedle.png"
        }
    }

    Row {
        anchors.top: speedometerNeedle.bottom
        anchors.topMargin: 120
        anchors.horizontalCenter: speedometerNeedle.horizontalCenter
        spacing: 10

        Text {
            font.pixelSize: 24
            color:(ValueSource.gear === 0 && ValueSource.parkingBrake) ? "white" : "gray"
            text: "P"
        }

        Text {
            font.pixelSize: 24
            //font.bold: ValueSource.gear === -1
            color: ValueSource.gear === -1 ? "white" : "gray"
            text: "R"
        }

        Text {
            font.pixelSize: 24
            //font.bold: ValueSource.gear === 0
            color: (ValueSource.gear === 0 && !ValueSource.parkingBrake) ? "white" : "gray"
            text: "N"
        }

        Text {
            font.pixelSize: 24
            //font.bold: ValueSource.gear === 1
            color: ValueSource.gear === 1 ? "white" : "gray"
            text: "D"
        }
    }

    Text {
        id: speedText
        anchors.top: speedometerNeedle.top
        anchors.topMargin: -40
        anchors.horizontalCenter: speedometerNeedle.horizontalCenter
        font.pixelSize: 60
        color: "lightGray"
        text: speed
    }

    Text {
        id: speedUnitText
        anchors.top: speedText.bottom
        anchors.horizontalCenter: speedometerNeedle.horizontalCenter
        font.pixelSize: 24
        color: "lightGray"
        text: "KM/H"
    }
}
