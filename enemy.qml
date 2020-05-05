import QtQuick 2.0

import "enemiesGenerator.js" as EnemiesGenerator

Rectangle {
    id: heroShape
    color: "red"

    border.color: "white"
    border.width: 1
    radius: heroShape.width / 2

    property string enemySizeText

    Text {
        text: enemySizeText
        anchors.centerIn: heroShape
        color: "white"
        font {
            family: "Helvetica"
            pointSize: 16
            bold: true
        }
    }
}
