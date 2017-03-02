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

Item {
    property int iconMargin: 10

    anchors.horizontalCenter: parent.horizontalCenter
    width: bottomPanelImage.width
    height: bottomPanelImage.height

    Image {
        id: bottomPanelImage
        source: "../images/BottomPanel.png"
    }

    TurnIndicator {
        direction: Qt.LeftArrow
        anchors.verticalCenter: textTime.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 250
        active: ValueSource.turnSignal & Qt.LeftArrow
    }

    Image {
        id: iconCoolant
        source: ValueSource.engineTemperature >= 100.0 ? "../images/Icon_Coolant_ON.png"
                                                       : "../images/Icon_Coolant_OFF.png"
        anchors.verticalCenter: textTime.verticalCenter
        anchors.right: iconBattery.left
    }

    Image {
        id: iconBattery
        source: ValueSource.batteryLevel <= 25.0 ? "../images/Icon_Battery_ON.png"
                                                 : "../images/Icon_Battery_OFF.png"
        anchors.verticalCenter: textTime.verticalCenter
        anchors.right: iconFuel.left
    }

    Image {
        id: iconFuel
        source: ValueSource.fuelLevel <= 20.0 ? "../images/Icon_Fuel_ON.png"
                                              : "../images/Icon_Fuel_OFF.png"
        anchors.verticalCenter: textTime.verticalCenter
        anchors.right: iconParkingBrake.left
    }

    Image {
        id: iconParkingBrake
        source: ValueSource.parkingBrake ? "../images/Icon_ParkingBrake_ON.png"
                                         : "../images/Icon_ParkingBrake_OFF.png"
        anchors.verticalCenter: textTime.verticalCenter
        anchors.right: textTime.left
        anchors.rightMargin: 5
    }

    Text {
        id: textTime
        text: ValueSource.time
        font.pixelSize: 24 //18
        color: "white"
        anchors.centerIn: parent
    }

    Image {
        id: iconLowbeam
        source: ValueSource.lowBeam ? "../images/Icon_LowBeam_ON.png"
                                    : "../images/Icon_LowBeam_OFF.png"
        anchors.verticalCenter: textTime.verticalCenter
        anchors.left: textTime.right
        anchors.leftMargin: iconMargin
    }

    Image {
        id: iconTyre
        source: ValueSource.flatTire ? "../images/Icon_TyreMalfunction_ON.png"
                                     : "../images/Icon_TyreMalfunction_OFF.png"
        anchors.verticalCenter: textTime.verticalCenter
        anchors.left: iconLowbeam.right
    }

    Image {
        id: iconLamp
        source: ValueSource.lightFailure ? "../images/Icon_BulbFailure_ON.png"
                                         : "../images/Icon_BulbFailure_OFF.png"
        anchors.verticalCenter: textTime.verticalCenter
        anchors.left: iconTyre.right
    }

    Image {
        id: iconSeatbelt
        //source: ValueSource.seatBelt ? "../images/Icon_SeatBelt_ON.png"
        //                             : "../images/Icon_SeatBelt_OFF.png"
        source: "../images/Icon_SeatBelt_ON.png"
        anchors.verticalCenter: textTime.verticalCenter
        anchors.left: iconLamp.right
    }

    TurnIndicator {
        direction: Qt.RightArrow
        anchors.verticalCenter: textTime.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 250
        active: ValueSource.turnSignal & Qt.RightArrow
    }
}
