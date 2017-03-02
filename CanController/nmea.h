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

#ifndef NMEA_H
#define NMEA_H

#include <QStringList>
#include <QDateTime>
#include <QByteArray>
#include <QList>
#include <QVariant>

#include "valuetypes.h"

class NMEA
{
protected:
    NMEA();

public:
    virtual ~NMEA();

    // NOTE: ownership is changed, caller must delete
    static NMEA* parse(QString data);
    bool isValid() const;
    NMEAType::Type type() const;
    virtual QVariant value(NMEAType::Value type) const;
    virtual void setValue(NMEAType::Value type, QVariant value);

protected:
    struct NMEAPrivate* m_private;

};


// GeoBase

class GeoBase : public NMEA
{
protected:
    GeoBase();

public:
    virtual ~GeoBase();
    virtual QVariant value(NMEAType::Value type) const;
    virtual void setValue(NMEAType::Value type, QVariant value);
};


// GGA

class GGA : public GeoBase
{
public:
    virtual ~GGA();
    virtual QVariant value(NMEAType::Value type) const;
    virtual void setValue(NMEAType::Value type, QVariant value);

private:
    GGA(QStringList data);
    friend class NMEA;
};


// RMC

class RMC : public GeoBase
{
public:
    virtual ~RMC();
    virtual QVariant value(NMEAType::Value type) const;
    virtual void setValue(NMEAType::Value type, QVariant value);

private:
    RMC(QStringList data);
    friend class NMEA;
};

#endif // NMEA_H
