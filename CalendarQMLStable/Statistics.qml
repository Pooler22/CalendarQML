import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import Ubuntu.Components.Pickers 1.0
import Ubuntu.Components.Popups 1.3
import "storage.js" as Storage

Page{
    title: "Statystyki"

    Component.onCompleted: {
            textlabel.text = Storage.get("labeltext", "Hello World")
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                textlabel.text = textinput.text
                Storage.set("labeltext", textlabel.text)
            }
        }

        TextField {
            id: textinput
            placeholderText: "text"
            anchors.centerIn: parent
        }

        Text {
            id: textlabel
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: textinput.bottom
        }


}
