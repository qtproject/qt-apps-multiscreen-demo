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

#ifndef SCENEHELPER_H
#define SCENEHELPER_H

#include <QResource>

#include <Qt3DRender/QRenderAspect>
#include <Qt3DRender/QSceneLoader>
#include <Qt3DCore/QEntity>
//#include <Qt3DRender/QCameraLens>
#include <Qt3DRender/QMaterial>
#include <Qt3DQuick/QQmlAspectEngine>
#include <Qt3DCore/QComponent>
#include <QtQml>

class SceneHelper : public QObject
{
    Q_OBJECT

public:
    Q_INVOKABLE QObject *findEntity(Qt3DRender::QSceneLoader *loader, const QString &name);
    Q_INVOKABLE void addListEntry(const QVariant &list, QObject *entry);
    Q_INVOKABLE void removeFromScene(Qt3DRender::QSceneLoader *loader, const QStringList &names);
    Q_INVOKABLE void addMaterials(Qt3DRender::QSceneLoader *loader,
                                  Qt3DRender::QMaterial *material, QStringList names);
    Q_INVOKABLE void addMaterial(Qt3DRender::QSceneLoader *loader,
                                 Qt3DRender::QMaterial *material, QString name);
    Q_INVOKABLE void replaceMaterial(Qt3DRender::QSceneLoader *loader, const QString &name,
                                     Qt3DRender::QMaterial *material);
    //Q_INVOKABLE void searchCamera(Qt3DRender::QSceneLoader *loader, const QString &name);

private:
    void addComponents(QStringList &names, Qt3DCore::QEntity *root,
                       Qt3DRender::QMaterial *material);
    void addComponent(QString &name, Qt3DCore::QEntity *root, Qt3DRender::QMaterial *material);
};

#endif // SCENEHELPER_H
