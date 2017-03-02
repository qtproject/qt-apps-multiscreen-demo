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

Item {
    id: carFrame

    width: electricCar ? carShapeElectric.width : carShape.width
    height: electricCar ? carShapeElectric.height : carShape.height

    property bool electricCar: false

    property bool headLight: false
    property bool leftBlink: false
    property bool rightBlink: false
    property bool breakLight: false

    property bool leftFrontDoorOpen: false
    property bool leftBackDoorOpen: false
    property bool rightFrontDoorOpen: false
    property bool rightBackDoorOpen: false
    property bool bootDoorOpen: false
    property bool hoodDoorOpen: false

    // Sports Car
    Image {
        id: carShape
        visible: !electricCar
        source: "qrc:/S-Car_Shape.png"
    }
    Image {
        visible: !electricCar
        source: breakLight ? "qrc:/S-Car_BrakesON.png" : "qrc:/S-Car_BrakesOFF.png"
    }
    Image {
        visible: !electricCar
        source: leftFrontDoorOpen ? "qrc:/S-Car_DoorLeftON.png" : "qrc:/S-Car_DoorLeftOFF.png"
    }
    Image {
        visible: !electricCar
        source: rightFrontDoorOpen ? "qrc:/S-Car_DoorRightON.png" : "qrc:/S-Car_DoorRightOFF.png"
    }
    Image {
        visible: !electricCar
        source: hoodDoorOpen ? "qrc:/S-Car_HoodON.png" : "qrc:/S-Car_HoodOFF.png"
    }
    Image {
        visible: !electricCar
        source: headLight ? "qrc:/S-Car_LowBeamsON.png" : "qrc:/S-Car_LowBeamsOFF.png"
    }
    Image {
        visible: !electricCar
        source: bootDoorOpen ? "qrc:/S-Car_TrunkON.png" : "qrc:/S-Car_TrunkOFF.png"
    }
    Image {
        visible: !electricCar
        source: leftBlink ? "qrc:/S-Car_TurnLeftON.png" : "qrc:/S-Car_TurnLeftOFF.png"
    }
    Image {
        visible: !electricCar
        source: rightBlink ? "qrc:/S-Car_TurnRightON.png" : "qrc:/S-Car_TurnRightOFF.png"
    }

    // Electric Car
    Image {
        id: carShapeElectric
        visible: electricCar
        source: "qrc:/E-Car_Shape.png"
    }
    Image {
        visible: electricCar
        source: breakLight ? "qrc:/E-Car_BrakesON.png" : "qrc:/E-Car_BrakesOFF.png"
    }
    Image {
        visible: electricCar
        source: leftFrontDoorOpen ? "qrc:/E-Car_FrontDoorLeftON.png"
                                  : "qrc:/E-Car_FrontDoorLeftOFF.png"
    }
    Image {
        visible: electricCar
        source: rightFrontDoorOpen ? "qrc:/E-Car_FrontDoorRightON.png"
                                   : "qrc:/E-Car_FrontDoorRightOFF.png"
    }
    Image {
        visible: electricCar
        source: leftBackDoorOpen ? "qrc:/E-Car_BackDoorLeftON.png"
                                 : "qrc:/E-Car_BackDoorLeftOFF.png"
    }
    Image {
        visible: electricCar
        source: rightBackDoorOpen ? "qrc:/E-Car_BackDoorRightON.png"
                                  : "qrc:/E-Car_BackDoorRightOFF.png"
    }
    Image {
        visible: electricCar
        source: hoodDoorOpen ? "qrc:/E-Car_HoodON.png" : "qrc:/E-Car_HoodOFF.png"
    }
    Image {
        visible: electricCar
        source: headLight ? "qrc:/E-Car_LowBeamsON.png" : "qrc:/E-Car_LowBeamsOFF.png"
    }
    Image {
        visible: electricCar
        source: bootDoorOpen ? "qrc:/E-Car_TrunkON.png" : "qrc:/E-Car_TrunkOFF.png"
    }
    Image {
        visible: electricCar
        source: leftBlink ? "qrc:/E-Car_TurnLeftON.png" : "qrc:/E-Car_TurnLeftOFF.png"
    }
    Image {
        visible: electricCar
        source: rightBlink ? "qrc:/E-Car_TurnRightON.png" : "qrc:/E-Car_TurnRightOFF.png"
    }
}
