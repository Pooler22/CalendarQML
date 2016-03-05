import QtQuick 2.4
import Ubuntu.Components 1.3
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
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Data ostatniego okresu:"
        }

        Button {
            property date date: new Date()
            id: dateButton
            text : Qt.formatDateTime(date, "dddd, dd/MMMM/yyyy")
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: PickerPanel.openDatePicker(dateButton, "date", "Days|Months|Years")
        }

        Label{
            text: "Średni czas trwania cyklu"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label{
            text: "Długość miesiączki:"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button{
            text: "Zapisz"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
