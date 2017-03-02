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

#include <QGuiApplication>
#include <QQuickView>
#include <QObject>
#include <QQmlEngine>
#include <QQmlContext>

#include "gpssender.h"

#ifdef TCPCLUSTERDATACONNECTION
#include "tcpclusterdatacontrol.h"
#else
#include <QTime>
#include "canclusterdatacontrol.h"
#endif

int main(int argc, char** argv)
{
    QGuiApplication app(argc, argv);

    ClusterDataControlInterface* dataInterface(Q_NULLPTR);

#ifdef TCPCLUSTERDATACONNECTION
    dataInterface = new TCPClusterDataControl;
#else
    dataInterface = new CanClusterDataControl;
#endif

    Q_ASSERT(dataInterface);

    QString routeFileName(DEFAULT_ROUTE_FILE);
    QStringList args(app.arguments());
    if (args.count() > 1) {
        routeFileName = args.at(1);
    }

    GpsSender gpsSender(routeFileName);

    QObject::connect(&gpsSender, SIGNAL(latitudeChanged(qreal)), dataInterface, SLOT(setLatitude(double)));
    QObject::connect(&gpsSender, SIGNAL(longitudeChanged(qreal)), dataInterface, SLOT(setLongitude(double)));
    QObject::connect(&gpsSender, SIGNAL(directionChanged(qreal)), dataInterface, SLOT(setDirection(double)));
    QObject::connect(&gpsSender, SIGNAL(vehicleSpeedChanged(qreal)), dataInterface, SLOT(setVehicleSpeed(double)));

#ifndef TCPCLUSTERDATACONNECTION
    QObject::connect(&gpsSender, SIGNAL(positionChanged(QTime)), qobject_cast<CanClusterDataControl*>(dataInterface), SLOT(sendPosition(QTime)));
#endif

    QQuickView view;

    view.rootContext()->setContextProperty("clusterDataControl", dataInterface);

    QObject::connect(view.engine(), SIGNAL(quit()), &app, SLOT(quit()));

    view.setSource(QUrl(MAIN_QML_FILE_NAME));

    view.show();

    return app.exec();
}
