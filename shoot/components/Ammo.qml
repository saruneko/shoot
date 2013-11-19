import QtQuick 2.0
import Ubuntu.Components 0.1
import Box2D 1.0

Body {
    id: root

    property var _size: units.gu(6)

    linearDamping: 0.3
    angularDamping: 0.2

    fixtures: Circle {
        radius: ammo.radius
        density: 0.2
        friction: 0.3
        restitution: 0.2
    }

    Rectangle {
        id: axis
        width: 1
        height: 1
        color: "transparent"
        x: root.x + (root._size / 2)
        y: root.y + (root._size / 2)
    }
    Rectangle {
        id: axisIndicator
        width: units.dp(5)
        height: units.dp(5)
        radius: width / 2
        anchors.centerIn: axis
        color: "white"
    }

    Rectangle {
        id: ammo
        width: root._size
        height: root._size
        radius: width / 2
        color: "transparent"
        border.color: "white"
        border.width: units.dp(5)
        smooth: true
        anchors.centerIn: axis

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            rotation: -root.rotation

            drag {
                target: ammo
                axis: Drag.XAndYAxis
                minimumY: axis.y - 35 - ammo.height
                maximumY: axis.y + 35
                minimumX: axis.x - 35 - ammo.width
                maximumX: axis.x + 35
            }

//            onReleased: {
            onEntered: {
                var dx = mouseX - ammo.width / 2;
                var dy = mouseY - ammo.height / 2;
                var abs = Math.sqrt(dx * dx + dy * dy)
                var point = Qt.point(root.x, root.y);
                var force = Qt.point(-1000 * dx / abs, -1000 * dy / abs);
                root.applyLinearImpulse(force, point);
                root.fixedRotation = true;
                root.fixedRotation = false;
            }
        }
    }

}
