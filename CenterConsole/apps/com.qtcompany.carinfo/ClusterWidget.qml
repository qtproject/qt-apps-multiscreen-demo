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
import utils 1.0

Item {
    id: carinfoContainer

    property int total: 0
    property int sinceLast: 0
    opacity: 0.5
    property int defaultXPos: 0
    x: defaultXPos

    Image {
        id: image
        width: 265
        height: 145
        source: Style.symbol("CarInfo")
    }

    Row {
        scale: 0.75
        spacing: 10
        anchors.top: image.bottom
        anchors.horizontalCenter: image.horizontalCenter

        CarInfoField {
            title: "Total distance"
            value: total.toString()
            unit: "km"
        }

        CarInfoField {
            title: "Since last\ncharge"
            value: sinceLast.toString()
            unit: "km"
        }
    }

    Timer {
        id: fadeOutTimer
        interval: 5000
        running: false
        repeat: false
        onTriggered: {
            fadeOut.start()
        }
    }

    PropertyAnimation on opacity {
        id: fadeIn
        to: 1.0
        duration: 500
    }

    PropertyAnimation on opacity {
        id: fadeOut
        to: 0.5
        duration: 500
    }

    // TODO: Find out why these commented-out animations cause flashing on HW, and fix it
//    PropertyAnimation on x {
//        id: startupAnimation
//        to: 0
//        duration: 500
//        easing.type: Easing.InCubic
//    }

    Component.onCompleted: {
//        startupAnimation.start()
//        fadeIn.start()
//        fadeOutTimer.start()
    }

    onVisibleChanged: {
        if (visible) {
//            x = defaultXPos
//            startupAnimation.start()
            fadeIn.start()
            fadeOutTimer.restart()
        }
    }
}

