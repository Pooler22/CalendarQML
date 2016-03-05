import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import Ubuntu.Components.Pickers 1.0
import Ubuntu.Components.Popups 1.3

Page {
    title: "Welcome"

    Column{
        anchors.horizontalCenter: parent.horizontalCenter
        Label{
            text: "Data ostatniego okresu"
        }
        Label{
            text: "Średni czas trwania cyklu"
        }
        Label{
            text: "Długość trwania miesiączki"
        }
        Button{
            id: accept
                text: qsTr("OK")

        }
    }

}

