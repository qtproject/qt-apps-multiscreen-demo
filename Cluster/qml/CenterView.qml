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
import models 1.0
import controls 1.0
import utils 1.0

Item {
    anchors.fill: parent
    property real defaultScale: 1.0
    property var previousView: initialView

    Image {
        id: initialView
        source: Style.symbol("john")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 400
    }

    Item {
        id: musicContainer
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 270
        width: 354
        height: 354
        default property alias content: musiccontainer.children

        Item {
            id: musiccontainer
            anchors.fill: parent
        }
    }

    Item {
        id: contactContainer
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 350
        width: 136
        height: 250
        default property alias content: contactcontainer.children

        Item {
            id: contactcontainer
            anchors.fill: parent
        }
    }

    Item {
        id: carinfoContainer
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 340
        width: 265
        height: 250
        default property alias content: carinfocontainer.children

        Item {
            id: carinfocontainer
            anchors.fill: parent
        }
    }

    Item {
        id: calendarContainer
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 340
        width: 220
        height: 250
        default property alias content: calendarcontainer.children

        Item {
            id: calendarcontainer
            anchors.fill: parent
        }
    }

    Connections {
        target: ApplicationManagerInterface
        onClusterWidgetReady: {
            handleWidgetChange(category, item)
        }
        onClusterWidgetActivated: {
            handleWidgetChange(category, item)
        }
    }

    PropertyAnimation {
        id: shrinkCenter
        property: "scale"
        to: 0.0
        running: false
        duration: 500
        onStopped: {
            target.visible = false
        }
    }

    function handleWidgetChange(category, item) {
        var container
        if (category === "media")
            container = musicContainer
        else if (category === "contacts")
            container = contactContainer
        else if (category === "carinfo")
            container = carinfoContainer
        else if (category === "calendar")
            container = calendarContainer
        if (previousView !== container) {
            // TODO: Find out why these commented-out animations cause flashing on HW, and fix it
            //container.scale = defaultScale
            container.visible = true
            previousView.visible = false
            //shrinkCenter.target = previousView
            previousView = container
            //shrinkCenter.start()
            item.parent = container
            container.content = item
            item.width = container.width
            item.height = container.height
        }
    }
}
