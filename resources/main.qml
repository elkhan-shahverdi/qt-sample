import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.11
import QtQuick.Dialogs 1.3

import './' as MyCustomComponents   // all the components in the same directory


ApplicationWindow {
    id: rooteID
    title: "Color Picker 1.2 (By: AAlizadeh@oplaenergy.com)"
    x: 750
    y: 500
    width: 600
    height: 200
    minimumHeight: 175
    minimumWidth: 375
    visible: true
    color: "white"

    onHeightChanged: {
        let h1=height*2/3
        let h2=(width*3/4)*304/800
        oplaLogo.height=Math.min(h1,h2)
        oplaLogo.width=oplaLogo.height*800/305
    }
    onWidthChanged: {
        let w1=width*2/3
        let w2=(height*3/4)*800/305
        oplaLogo.width=Math.min(w1,w2)
        oplaLogo.height= oplaLogo.width*350/800
    }


    Rectangle {
        id:colorPickerID
        anchors.fill: parent
        color: "#707fc2"
        radius: 5
        border.color: "black"
        border.width: 2
        Image {
            id: oplaLogo
            source: "../rcs/logo.png"
            anchors.centerIn: parent
            height: parent.height*2/3
            width: 800*height/304
        }

        Text {
            id: textColorID
            x:15
            y:5
            visible: false
            text: "Click to pick a color"
            font.pointSize: 12
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: textColorID.visible=true
            onExited: textColorID.visible=false
            onClicked: {
                colorDialID.open()
            }
        }

        MyCustomComponents.CustomButton {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            width: 125
            height: 25
            text: "Exit"
            onClicked: {
                rooteID.close()
            }
        }

        ColorDialog {
            id:colorDialID

            onVisibleChanged: visible? color=colorPickerID.color: {}

            onCurrentColorChanged: {
                //console.log("This color name is: "+currentColor)
                rooteID.title= "Color is: "+currentColor
            }

            onAccepted: {
                colorPickerID.color=color
                console.log("Selected color name is: "+color)
            }
        }
    }
}
