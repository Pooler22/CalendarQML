import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import Ubuntu.Components.Pickers 1.0
import Ubuntu.Components.Popups 1.3

Page{
id: proba
    function day(){
        var currentMonth = new Date().midnight()
        return currentMonth.toLocaleString(Qt.locale(),i18n.tr("dd MMMM yyyy"))

  }
    function dayOfWeek()
    {
        var currentday= new Date().monthStart.midnight();
        return currentday.toLocaleString()
    }
    function firstDeyOfTheMonth()
    {
        var dzis= new Date()
        var firstDay= new Date(dzis.getFullYear(),dzis.getMonth(),1)
        return firstDay.getDay()
    }


    title: firstDeyOfTheMonth()
        //day()
    Column{
      //  anchors.fill: parent

        Grid{
            id: siatka
            columns: 7
            rows: 1


            Rectangle { color: "pink"; width: proba.width / 7; height: 50; Text {
                    id: pon
                    text: qsTr("pon")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                } }
            Rectangle { color: "pink"; width:  proba.width / 7; height: 50; Text {
                    id: wt
                    text: qsTr("wt")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                } }
            Rectangle { color: "pink"; width:  proba.width / 7; height: 50; Text {
                    id: sr
                    text: qsTr("śr")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                } }
            Rectangle { color: "pink"; width:  proba.width / 7; height: 50; Text {
                    id: czw
                    text: qsTr("czw")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                } }
            Rectangle { color: "pink"; width: proba.width / 7 ; height: 50; Text {
                    id: pt
                    text: qsTr("pt")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                } }
            Rectangle { color: "pink"; width: proba.width / 7; height: 50; Text {
                    id: so
                    text: qsTr("sob")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                } }
            Rectangle { color: "pink"; width:  proba.width / 7; height: 50; Text {
                    id: nie
                    text: qsTr("nie")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                } }



        }

        Grid{
            columns: 7
            rows: 6
            //anchors.top: siatka.bottom
            Rectangle { color: "red"; width: 50; height: 50;
                MouseArea{
                    anchors.fill: parent
                    onClicked: parent.color="green"
                }
            }

        }
    }
    QtObject{
        property var periodDtatus;

    }
}

