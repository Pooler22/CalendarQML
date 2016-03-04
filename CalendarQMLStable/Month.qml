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
     property date ovulationDate: new Date()
     Calendar {
         id: calendar
         weekNumbersVisible: true
          anchors.fill: parent

          dayDelegate: Rectangle
          {

          Rectangle
          {
          }
     }


}
}
