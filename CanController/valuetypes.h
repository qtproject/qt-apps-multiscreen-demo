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

#ifndef VALUETYPES
#define VALUETYPES

namespace NMEAType
{
    enum {
        NMEAStart = 0x01,
        NMEAEnd = 0x0f,

        GeoBaseStart = 0x10,
        GeoBaseEnd = 0x1f,

        GGAStart  = 0x20,
        GGAEnd = 0x2f,

        RMCStart = 0x30,
        RMCEnd = 0x3f,
    };

    enum Type {
        UndefinedType = 0,
        GGAType,
        RMCType
    };

    enum Value {
        UTCTime = NMEAStart,
        CheckSum,

        Latitude = GeoBaseStart,
        Longitude,

        GGAQuality = GGAStart,
        GGASatellites,
        GGADilution,
        GGAAltitude,
        GGAGeoid,

        RMCActive = RMCStart,
        RMCSpeed,
        RMCAngle,
        RMCDate,
        RMCVariation

    };
}

#endif // VALUETYPES

