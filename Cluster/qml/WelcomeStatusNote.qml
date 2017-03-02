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

Item {
    property string position: "right"
    property alias text: statusNoteText.text
    property string icon
    property string highlight

    Column {
        spacing: 5

        Row {
            id: statusNoteRow
            spacing: 5

            Image {
                id: statusNotePointerImage
                height: 66
                fillMode: Image.Pad
                source: position === "left" ? icon : highlight
                anchors.verticalCenter: statusNoteImage.verticalCenter
            }

            Rectangle {
                id: statusNoteLineImage
                height: 2
                width: 100
                color: "gray"
                anchors.verticalCenter: statusNoteImage.verticalCenter
            }

            Image {
                id: statusNoteImage
                height: 66
                fillMode: Image.Pad
                source: position === "right" ? icon : highlight
            }
        }

        Text {
            id: statusNoteText
            anchors.right: position === "right" ? statusNoteRow.right : undefined
            anchors.left: position === "left" ? statusNoteRow.left : undefined
            style: Text.RichText
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
