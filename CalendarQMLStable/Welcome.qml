import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import Ubuntu.Components.Pickers 1.0
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
        Label{
            text: "Data ostatniego okresu"

        }
        Button {
            property date date: new Date()
            id: dateButton
            text : Qt.formatDateTime(date, "dddd, dd/MMMM/yyyy")
            onClicked: PickerPanel.openDatePicker(dateButton, "date", "Days|Months|Years")

        }
        Label{
            text: "Średni czas trwania cyklu"
        }
        Picker {
            id: cycleDaysValue
            model: setRange(21,40)

            delegate: PickerDelegate {
                Label {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: modelData
                }
            }
        }
        Label{
            text: "Długość trwania miesiączki"
        }
        Picker {
            id: perioidDaysValue
            model: setRange(3,10)
            delegate: PickerDelegate {
                anchors.horizontalCenter: parent.horizontalCenter
                text: modelData
            }
        }

        Button{
            id: accept
            text: qsTr("OK")
        }
    }
}
