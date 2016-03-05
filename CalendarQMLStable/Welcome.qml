import QtQuick 2.5
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import Ubuntu.Components.Pickers 1.3
import Ubuntu.Components.Popups 1.3

Page {
    title: "Welcome"

    function setRange(minValue,maxValue){
        var tmpArray = []
        for (var i = minValue; i <= maxValue; i++) {
            tmpArray.push(i)
        }
        return tmpArray
    }

    Column{
        spacing: units.gu(2)
        anchors.horizontalCenter: parent.horizontalCenter

        Button {
            property date date: new Date()
            id: dateButton
            text : "Data ostatniego okresu: " + "<b>" + Qt.formatDateTime(date, "dd/MMMM/yyyy") + "</b>"
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: PickerPanel.openDatePicker(dateButton, "date", "Days|Months|Years")
        }

        ComboButton {
            id: combo
            text: "Średni czas trwania cyklu"
            expanded: false
            UbuntuListView {
                width: parent.width
                height: combo.comboListHeight
                model: setRange(21,40)
                delegate: ListItem.Standard {
                    text: modelData
                    onClicked: {
                        combo.text = "Średni czas trwania cyklu: " + "<b>" + text + "</b>";
                        combo.expanded = false;
                    }
                }
            }
        }

        ComboButton {
            id: combo1
            text: "Długość miesiączki:"
            expanded: false
            UbuntuListView {
                width: parent.width
                height: combo1.comboListHeight
                model: setRange(3,10)
                delegate: ListItem.Standard {
                    text: modelData
                    onClicked: {
                        combo1.text = "Długość miesiączki: " + "<b>" + text + "</b>";
                        combo1.expanded = false;
                    }
                }
            }
        }

        Button{
            text: "Zapisz"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
