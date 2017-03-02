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

pragma Singleton
import QtQuick 2.1
import com.pelagicore.datasource 1.0
import service.movie 1.0

SqlQueryDataSource {
    id: root
    database: "media"

    property url filePrefix: "file:///"
    property int currentIndex: 0
    property var currentEntry: get(currentIndex);
    property url currentSource: filePrefix + storageLocation + '/media/movies/' + currentEntry.source
    property url currentCover: filePrefix + storageLocation + '/media/movies/' + currentEntry.cover

    /*
    MediaPlayer.PlayingState 1 - the media is playing
    MediaPlayer.PausedState 2 - the media is paused
    MediaPlayer.StoppedState 0 - the media is stopped*/
    //Create playing state and seek to share between views
    property int state: 0
    property int seek: 0

    function selectRandom() {
        root.currentIndex = -1
        query = 'select * from movies order by random()'
        root.currentIndex = 0
    }

    function coverPath(cover) {
        return Qt.resolvedUrl(filePrefix + storageLocation + '/media/movies/' + cover)
    }

    function sourcePath(source) {
        return Qt.resolvedUrl(filePrefix + storageLocation + '/media/movies/' + source)
    }

    function next() {
        print('$movies.nextTrack()')
        root.currentIndex++
    }

    function previous() {
        print('$movies.previousTrack()')
        root.currentIndex--
    }

    Component.onCompleted: {
        MovieService.movieProvider = root
        MovieService.trackCount = Qt.binding(function() { return root.count})
        MovieService.currentTrack = Qt.binding(function() { return root.get(root.currentIndex)})
        MovieService.currentIndex = Qt.binding(function() { return root.currentIndex})
        print("*******************Movie provider completed")
    }
}
