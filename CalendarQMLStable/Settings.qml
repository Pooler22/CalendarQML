import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import Ubuntu.Components.Pickers 1.0
import Ubuntu.Components.Popups 1.3

Page{
    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: units.gu(2)

        Label {
            text: "Dzień rozpoczynający tydzień:"
        }

        ComboButton {
            id: combo1
            text: "Dzień rozpoczynający tydzień:"
            expanded: false
            UbuntuListView {
                width: parent.width
                height: combo1.comboListHeight
                model: ["Poniedziałek","Wtorek","Środa","Czwartek","Piątek","Sobota","Niedziela"]
                delegate: ListItem.Standard {
                    text: modelData
                    onClicked: {
                        combo1.text = "Dzień rozpoczynający tydzień: " + "<b>" + text + "</b>";
                        combo1.expanded = false;
                    }
                }
            }
        }

        ComboButton {
            id: combo
            text: "Metoda obliczeń średniej okresu:"
            expanded: false
            UbuntuListView {
                width: parent.width
                height: combo.comboListHeight
                model: ["Wszystkie okresy","Ostatnie 5 okresów"]
                delegate: ListItem.Standard {
                    text: modelData
                    onClicked: {
                        combo.text = "Dzień rozpoczynający tydzień: " + "<b>" + text + "</b>";
                        combo.expanded = false;
                    }
                }
            }
        }
    }
}
