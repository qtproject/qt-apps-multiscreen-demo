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
import QtApplicationManager 1.0

Item {
    id: root

    width: Style.screenWidth
    height: Style.launchBarHeight

    MusicWidget {
        id: musicWidget
        anchors.margins: Style.padding
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: Style.paddingXXL
        width: Style.launchBarHeight
        height: root.height
    }

    CalendarWidget {
        id: calendarWidget
        anchors.left: musicWidget.right
        anchors.right: parent.right
        anchors.top: parent.top
        height: root.height / 2
        width: Style.launchBarHeight
        anchors.margins: Style.padding
        anchors.rightMargin: Style.paddingXXL
    }
    Row {
        anchors.left: musicWidget.right
        anchors.top: calendarWidget.bottom
        anchors.bottom: musicWidget.bottom
        anchors.margins: Style.padding
        spacing: Style.padding

        ContactsWidget {
            id: contactsWidget
            width: 256
            height: 226
        }
        CarInfoWidget {
            width: 256
            height: 226
        }
    }
}
