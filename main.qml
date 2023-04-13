import QtQuick 2.15
import QtQuick.Window 2.15
import "components" as Components

Window {
    id: window
    visible: true
    width: 1200
    height: 800
    title: "Colored Quadrants " + width.toString() + "x" + height.toString()
    color: "white"
    opacity: 0.5

    Rectangle {
        id: rootangle
        anchors.fill: parent
        color: window.color
        anchors.margins: 0

        Components.RecursiveRectangle {
            id: rect1
            width: parent.width
            height: parent.height
        }
    }
}
