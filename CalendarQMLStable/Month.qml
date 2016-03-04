import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import Ubuntu.Components.Pickers 1.0
import Ubuntu.Components.Popups 1.3

import QtQuick.Controls 1.2
import QtQuick.Controls.Private 1.0
import QtQuick.Controls.Styles 1.1

Page{
    title: "Widok miesiąca"
    property date ovulationDate: (new Date())
    Calendar {
        id: calendar
        weekNumbersVisible: true
        anchors.fill: parent
        style: CalendarStyle
        {
        dayDelegate: Rectangle
        {
        property bool selectedDate: Qt.formatDateTime(ovulationDate,"dd:MM:yyyy").indexOf(Qt.formatDateTime(styleData.date,"dd:MM:yyyy")) > -1

        gradient: Gradient {
            GradientStop {
                position: 0.00
                color: styleData.selected ? "#442" : (selectedDate ? "#000" : (styleData.visibleMonth && styleData.valid ? "#444" : "#666"))
            }
            GradientStop {
                position: 1.00
                color: styleData.selected ? "#442" : (selectedDate ? "#000" : (styleData.visibleMonth && styleData.valid ? "#444" : "#666"))
            }
        }
        Label {
            text: styleData.date.getDate()
            anchors.centerIn: parent
            color: styleData.valid ? "white" : "grey"
        }
    }
}
}
}
