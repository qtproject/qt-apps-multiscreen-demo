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

import utils 1.0
import controls 1.0
import service.statusbar 1.0
import service.settings 1.0

Item {
    id: root
    width: Style.screenWidth
    height: Style.statusBarHeight
    z: 1
    Image {
        source: Style.symbol("SimpleBottomBackground")
        anchors.fill: parent
    }
    Row {
        id: indicatorTray
        spacing: Style.paddingXL
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.verticalCenter: parent.verticalCenter
        Repeater {
            id: repeater
            model: StatusBarService.indicators
            delegate: Image {
                source: Style.symbolXS(modelData.name)
            }
        }
    }
    Row {
        width: root.width / 4
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 10
        DateAndTime {}
    }

    Image {
        id: driverImage
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        source: Style.symbol("john")
        scale: 0.5
    }
}
