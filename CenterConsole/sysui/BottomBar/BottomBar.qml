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
import QtQuick.Layouts 1.0

import controls 1.0
import utils 1.0
import service.climate 1.0

Item {
    id: bottomBar
    width: Style.bottomBarWidth
    height: Style.bottomBarHeight
    Image {
        source: Style.symbol("SimpleBottomBackground")
    }

    RowLayout {
        id: row
        anchors.fill: parent

        TumblerTool {
            id: tempLevelLeft
            index: 10
            Layout.fillWidth: true
            anchors.verticalCenter: parent.verticalCenter
            onIndexChanged: {
                if (syncButton.checked === true)
                    tempLevelRight.index = tempLevelLeft.index
            }
        }
        ButtonTool {
            anchors.verticalCenter: parent.verticalCenter
            text: "AUTO"
        }
        Aircondition {
            anchors.verticalCenter: parent.verticalCenter
            Layout.fillWidth: true
        }
        ButtonTool {
            id: syncButton
            anchors.verticalCenter: parent.verticalCenter
            text: "SYNC"
            onCheckChanged: {
                if (check === true)
                    tempLevelRight.index = tempLevelLeft.index
            }
        }
        TumblerTool {
            id: tempLevelRight
            Layout.fillWidth: true
            index: 5
            anchors.verticalCenter: parent.verticalCenter
            onIndexChanged: {
                if (syncButton.checked === true && tempLevelRight.index !== tempLevelLeft.index)
                    syncButton.checked = false
            }
        }
    }
}
