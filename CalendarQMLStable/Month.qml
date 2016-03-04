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
     Calendar {
         id: calendar
         weekNumbersVisible: true
         style: CalendarStyle {
                 gridVisible: false
                 dayDelegate: Rectangle {
                     gradient: Gradient {
                         GradientStop {
                             position: 0.00
                             color: styleData.selected ? "#d11141" : (styleData.visibleMonth && styleData.valid ? "#FF3366" : "#666");
                         }
                         GradientStop {
                             position: 1.00
                             color: styleData.selected ? "#FF3366" : (styleData.visibleMonth && styleData.valid ? "##d11141" : "#666");
                         }
                         GradientStop {
                             position: 1.00
                             color: styleData.selected ? "#777" : (styleData.visibleMonth && styleData.valid ? "##d11141" : "#666");
                         }
                     }

                     Label {
                         text: styleData.date.getDate()
                         anchors.centerIn: parent
                         color: styleData.valid ? "white" : "green"
                     }

                     Rectangle {
                         width: parent.width
                         height: 1
                         color: "#fae7ec"
                         anchors.bottom: parent.bottom
                     }


                 }
             }
     }

}
