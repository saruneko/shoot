import QtQuick 2.0
import Ubuntu.Components 0.1
import Box2D 1.0

Page {
    id: root

    property int padding: 0

    signal timeout

    Rectangle {
        anchors.fill: parent
        color: 'white'

        World {
            id: world
            anchors.fill: parent
            gravity: Qt.point(0, -9)

            Rectangle {
                anchors.fill: parent
                anchors.margins: units.gu(1)
                color: main.colorBackground

                Timer {
                    id: timer
                    interval: 20
                    running: true
                    onTriggered: {
                        if((root.padding * 2) == root.width) {
                            root.timeout();
                        } else {
                            root.padding += 1;
                            timer.restart();
                        }
                    }
                }

                Rectangle {
                    id: timerBackground
                    color: "white"
                    height: units.gu(1)
                    anchors {
                        left: parent.left
                        right: parent.right
                        bottom: parent.bottom
                        bottomMargin: parent.height / 5
                    }
                }

                Rectangle {
                    id: timerForeground
                    color: main.colorBackground
                    border.color: "white"
                    border.width: 2
                    z: 1
                    height: units.gu(1)
                    anchors {
                        left: parent.left
                        right: parent.right
                        bottom: parent.bottom
                        bottomMargin: parent.height / 5
                        leftMargin: root.padding
                        rightMargin: root.padding
                    }
                }
            }

            Wall {
                id: ground
                height: 20
                anchors { left: parent.left; right: parent.right; top: parent.bottom }
            }
            Wall {
                id: ceiling
                height: 20
                anchors { left: parent.left; right: parent.right; bottom: parent.top }
            }
            Wall {
                id: leftWall
                width: 20
                anchors { right: parent.left; bottom: ground.top; top: ceiling.bottom }
            }
            Wall {
                id: rightWall
                width: 20
                anchors { left: parent.right; bottom: ground.top; top: ceiling.bottom }
            }
        }
    }
}
