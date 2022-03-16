import QtQuick 2.9
import QtQuick.Controls 2.4

Button {
    id: c_button
    text: "CustomButton"
    font.pixelSize:  12
    contentItem: Text {
        text: c_button.text
        font: c_button.font
        opacity: enabled ? 1.0 : 0.3
        color: c_button.down ? "black" : "white"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 36
        opacity: enabled ? 1 : 0.3
        color: c_button.down? "red" : "lightred"
        radius: 18
    }
}
