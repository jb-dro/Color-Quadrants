import QtQuick 2.15

Rectangle {
    id: recursiveRectangle
    border.width: 1
    border.color: "white"
    color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
    opacity: 0.5

    function split() {
        print("splitting " + width + "x" + height, "area: ", width*height)
        if (width*height < 1000) {
            return 1;
        }
        var newHeight, newWidth, rect;
        if (width >= height) {
            newWidth = Math.floor(width / 2);
            newHeight = height;

            rect = Qt.createQmlObject("RecursiveRectangle { width: " + newWidth + "; height: " + newHeight + "; }", parent);
            rect.x = x + newWidth;
            rect.y = y;
            width = newWidth;
        } else {
            newWidth = width;
            newHeight = Math.floor(height / 2);

            rect = Qt.createQmlObject("RecursiveRectangle { width: " + newWidth + "; height: " + newHeight + "; }", parent);
            rect.x = x;
            rect.y = y + newHeight;
            height = newHeight;
        }
        return 0;
    }

    Text {
        font.pixelSize: parent.width/5
        anchors.centerIn: parent
        text: parent.width + "x" + parent.height
        color: "black"
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.CrossCursor
        onClicked: {
            if (split() === 1) {
                color = Qt.rgba(Math.random(), Math.random(), Math.random(), Math.random());
            }
        }
    }
}
