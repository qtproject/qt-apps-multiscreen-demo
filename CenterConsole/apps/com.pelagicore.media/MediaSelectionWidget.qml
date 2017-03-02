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

import utils 1.0
import service.movie 1.0
import controls 1.0
import "."

Item {
    id: musicLibrary
    height: Style.launchBarHeight / 2
    width: 512
    anchors.margins: Style.padding
    anchors.rightMargin: Style.paddingXXL
    property alias model: repeater.model
    property string modelType


    Image {
        source: Style.symbol("RectangleGradient256x512")
    }

    Image {
        z: 2
        source: Style.symbol("MusicOverlayGradient2")
    }

    Label {
        id: title
        z: 3
        text: modelType
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: Style.paddingXXL
    }

    Grid {
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        rows: 2
        columns: 4
        Repeater {
            id: repeater

            delegate: Item {
                width: musicLibrary.width/4
                height: musicLibrary.height/2
                Image {
                    source: modelType === "Music" ? MusicProvider.coverPath(model.cover) : MovieService.coverPath(model.cover)
                    anchors.fill: parent
                }
            }
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked:
            root.modelType = modelType
    }
}
