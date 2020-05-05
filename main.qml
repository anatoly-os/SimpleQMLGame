import QtQuick 2.12
import QtQuick.Window 2.2

import "enemiesGenerator.js" as EnemiesGenerator

Window {
    id: mainWindow
    visible: true
    width: 480
    height: 640
    maximumHeight: 640
    minimumHeight: 640
    maximumWidth: 480
    minimumWidth: 480
    title: qsTr("Simple Game")

    Rectangle {
        id: mainScreen

        property int margin: 10

        width: mainWindow.width
        height: mainWindow.height

        color: "black"

        Rectangle {
            id: gameScreen

            anchors.bottom: mainScreen.bottom
            anchors.top: mainScreen.top
            anchors.left: mainScreen.left
            anchors.right: mainScreen.right
            anchors.topMargin: mainScreen.margin
            anchors.bottomMargin: mainScreen.margin
            anchors.leftMargin: mainScreen.margin
            anchors.rightMargin: mainScreen.margin

            radius: 20

            color: "#FAFAFA"
        }

        AttackButton {
            id: leftButton

            size: 300

            anchors.horizontalCenter: mainScreen.left
            anchors.verticalCenter: mainScreen.bottom

            color: "lightgrey"

            enabled: false

            Behavior on color {
                ColorAnimation {
                    duration: 1000
                }
            }

            TapHandler {
                onTapped: {
                    EnemiesGenerator.leftDamage();
                }
            }
        }

        AttackButton {
            id: rightButton

            size: 300

            anchors.horizontalCenter: mainScreen.right
            anchors.verticalCenter: mainScreen.bottom

            color: "lightgrey"

            enabled: false

            Behavior on color {
                ColorAnimation {
                    duration: 1000
                }
            }

            TapHandler {
                onTapped: {
                    EnemiesGenerator.rightDamage();
                }
            }
        }

        Rectangle {
            id: startGameButton

            width: gameScreen.width / 3
            height: 50

            radius: 10

            anchors.horizontalCenter: gameScreen.horizontalCenter
            anchors.bottom: gameScreen.bottom
            anchors.bottomMargin: 200

            color: "lightblue"

            Text {
                text: "Start New Game"
                font.family: "Helvetica"
                font.pointSize: 16
                anchors.centerIn: parent
            }

            Behavior on opacity {
                NumberAnimation {
                    duration: 1000
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    EnemiesGenerator.startNewGame();
                }
            }
        }

        Rectangle {
            id: levelRect

            property string level: "Level: 1"

            width: gameScreen.width / 4
            height: 30

            radius: 10

            anchors.top: gameScreen.top
            anchors.topMargin: 20
            anchors.horizontalCenter: gameScreen.horizontalCenter

            color: "black"

            Text {
                text: parent.level
                font.family: "Helvetica"
                font.pointSize: 12
                anchors.centerIn: parent

                color: "white"
            }
        }
    }
}
