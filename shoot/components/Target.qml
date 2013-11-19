import QtQuick 2.0
import Ubuntu.Components 0.1

Item {
    id: root

    property int hits: 1
    property var _baseRadius: units.gu(10)
    property var _size: root._baseRadius * root.hits

    property int variation: 6
    property bool _growing: true
    property int _pulseMinVariation: 6
    property int _pulseMaxVariation: 18

    Timer {
        id: timer
        interval: 1000
        running: true
        triggeredOnStart: true
        onTriggered: {
            if(variation == root._pulseMinVariation) {
                root.variation = root._pulseMaxVariation;
                root._growing = true;
            } else {
                root.variation = root._pulseMinVariation;
                root._growing = false;
            }
            restart();
        }
    }

    Behavior on variation { PropertyAnimation { duration: 1000 } }

    Rectangle {
        id: axis
        color: "transparent"
        width: 1
        height: 1
        x: root.x + (root._size / 2)
        y: root.y + (root._size / 2)
    }

    Rectangle {
        id: pulse
        width: root._size + root.variation
        height: root._size + root.variation
        anchors.centerIn: axis
        radius: width / 2
        color: "transparent"
        border.color: "white"
        border.width: 1
        smooth: true

        Rectangle {
            id: content
            width: root._size
            height: root._size
            radius: width / 2
            color: "white"
            smooth: true
            anchors.centerIn: pulse
        }
    }


}
