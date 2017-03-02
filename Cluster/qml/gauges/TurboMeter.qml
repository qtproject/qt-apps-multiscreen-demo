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
    property real turbometerNeedleRotation: turboValue * turboDegreesPerValue
    property real turboValue: ValueSource.rpm / 2000.
    property real maxValueAngle: 270
    property real minValueAngle: 0
    property real maximumValue: 4.0
    property real turboDegreesPerValue: Math.abs((maxValueAngle - minValueAngle) / maximumValue)

    anchors.left: parent.left
    anchors.top: parent.top
    anchors.leftMargin: 639
    anchors.topMargin: 140
    width: 164
    height: 10
    rotation: turbometerNeedleRotation - 90

    Image {
        width: 57
        height: 5
        //opacity: 0.75
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        source: "../../images/SpeedometerNeedle.png"
    }
}
