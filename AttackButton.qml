import QtQuick 2.0

Rectangle {
    id: attackButton

    property int size: 50
    property int damageMin: 3
    property int damageMax: 5

    width: size
    height: width
    radius: width / 2
}
