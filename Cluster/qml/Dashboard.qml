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
import service.valuesource 1.0
import "gauges"

Image
{
    id: dashboardEntity
    // for static dashboard
    source: "../images/Cluster8Gauges.png"
    // for 2.5D lighting effect
    //source: "../images/Cluster8GaugesPlain.png"
    anchors.fill: parent

    property bool parentVisible: parent.visible

    property real timeScaleMultiplier: 1.0
    property bool startupAnimationsFinished: false

    property alias bottomPanelY: bottompanel.y
    property alias needleRotation: tachometer.tachometerNeedleRotation

    onNeedleRotationChanged: speedometer.speedometerNeedleRotation = needleRotation / 40.

    //
    // Fuelmeter
    //
    FuelMeter {}

    //
    // Batterymeter
    //
    BatteryMeter {}

    //
    // Consumptionmeter
    //
    ConsumptionMeter {}

    //
    // Temperaturemeter
    //
    TemperatureMeter {}

    //
    // Turbometer
    //
    TurboMeter {}

    //
    // Fpsmeter
    //
    FpsMeter {}

    //
    // Bottom Panel
    //
    BottomPanel {
        id: bottompanel
        y: 720
    }

    //
    // Gauge center pieces
    //
    Image {
        // for static dashboard
        source: "../images/ClusterGaugeCenters.png"
        // for 2.5D lighting effect
     //   source: "../images/ClusterGaugeCentersPlain.png"
        anchors.fill: parent
    }

    // These two must be after center pieces, as they print text on top of the image

    //
    // Speedometer
    //
    SpeedoMeter {
        id: speedometer
    }

    //
    // Tachometer
    //
    TachoMeter {
        id: tachometer
    }

    //
    // 2.5D illusion for the 2.5D dashboard
    //

    // for speed-based effect
    //property real speed: ValueSource.kph
    //property int xlight: speed * 5
    // for animated effect
//    property int xlight: -960
//    property int ylight: 0
//    property real angle: -10

//    ShaderEffect {
//        id: bumpShader
//        anchors.fill: parent
//        //property vector3d lightPos: Qt.vector3d(xlight, ylight, 0) // If using speed-based effect
//        property vector3d lightPos: Qt.vector3d(xlight, ylight, 0) // If using the animations below
//        property var source: ShaderEffectSource {
//            sourceItem: dashboardEntity
//        }
//        property var bump: Image {
//            source: "../images/Gauges_normal.png"
//        }
//        property real angle: dashboardEntity.angle * Math.PI / 180.0
//        fragmentShader:
//            "
//            uniform sampler2D source;
//            uniform sampler2D bump;
//            varying vec2 qt_TexCoord0;
//            uniform float qt_Opacity;
//            uniform vec3 lightPos;
//            uniform float angle;

//            highp vec3 dbModel(const highp vec3 norm)
//            {
//                // Transform position, normal, and tangent to eye coords
//                vec3 normal = vec3(0, 1, 0);
//                vec3 tangent = vec3(1, 0, -1);
//                vec3 position = vec3(960, -4000, 540);

//                // Calculate binormal vector
//                vec3 binormal = normalize(cross(normal, tangent));

//                // Construct matrix to transform from eye coords to tangent space
//                mat3 tangentMatrix = mat3 (
//                    tangent.x, binormal.x, normal.x,
//                    tangent.y, binormal.y, normal.y,
//                    tangent.z, binormal.z, normal.z);

//                // Transform light direction and view direction to tangent space
//                vec3 s = lightPos - position;
//                vec3 lightDir = normalize(tangentMatrix * s);

//                vec3 v = -position;
//                vec3 viewDir = normalize(tangentMatrix * v);

//                float oldX = lightDir.x;
//                lightDir.x = (lightDir.x * cos(angle) - lightDir.z * sin(angle));
//                lightDir.z = (oldX * sin(angle) + lightDir.z * cos(angle));

//                vec3 ka = vec3(1.0, 1.0, 1.0);
//                vec3 ks = vec3(0.25, 0.25, 0.25);
//                float shininess = 50.0;

//                // Reflection of light direction about normal
//                vec3 r = reflect(-lightDir, norm);

//                vec3 diffuseColor = texture2D(source, qt_TexCoord0).rgb;

//                // Calculate the ambient contribution
//                vec3 ambient = ka * diffuseColor;

//                // Calculate the diffuse contribution
//                float sDotN = max(dot(lightDir, norm), 0.0);
//                vec3 diffuse = diffuseColor * sDotN;

//                // Calculate the specular highlight contribution
//                vec3 specular = vec3(0.0);
//                if (sDotN > 0.0)
//                    specular = ks * pow(max(dot(r, viewDir), 0.0), shininess);

//                //return specular;
//                //return ambient;
//                //return ambient + diffuse;
//                return diffuse + specular;
//                //return ambient + specular;
//                //return ambient + diffuse + specular;
//            }

//            void main()
//            {
//                vec4 normal = 2.0 * texture2D(bump, qt_TexCoord0) - vec4(1.0);
//                vec3 result = dbModel(normalize(normal.xyz));
//                gl_FragColor = qt_Opacity * vec4(result, 1.0);
//            }
//            "
//    }

//    SequentialAnimation {
//        running: true
//        loops: Animation.Infinite
//        PropertyAnimation {
//            target: dashboardEntity
//            property: "xlight"
//            from: -960
//            to: 1920
//            duration: 15000
//            easing.type: Easing.InOutQuad
//        }
//        PropertyAnimation {
//            target: dashboardEntity
//            property: "xlight"
//            from: 1920
//            to: -960
//            duration: 15000
//            easing.type: Easing.InOutQuad
//        }
//    }

    //
    // Startup animations
    //
    SequentialAnimation {
        id: speedometerStartupAnimations
        running: false

        SmoothedAnimation {
            target: dashboardEntity
            property: "bottomPanelY"
            from: 720
            to: 603
            duration: 1000 * timeScaleMultiplier
            easing.type: Easing.InCirc
        }

        SmoothedAnimation {
            target: dashboardEntity
            property: "needleRotation"
            from: 0.0
            to: -8000.0
            duration: 1000 * timeScaleMultiplier
            easing.type: Easing.InCubic
        }

        SmoothedAnimation {
            target: dashboardEntity
            property: "needleRotation"
            from: -8000.0
            to: 0.0
            duration: 1000 * timeScaleMultiplier
            easing.type: Easing.OutCubic
        }

        ScriptAction {
            script: {
                startupAnimationsFinished = true
                ValueSource.startAnimations = true
            }
        }
    }

    // Just a hack for now; wait for the fader to finish
    onParentVisibleChanged: {
        if (visible)
            initTimer.start()
    }

    Timer {
        id: initTimer
        running: false
        interval: 1000
        onTriggered: speedometerStartupAnimations.start()
    }
}
