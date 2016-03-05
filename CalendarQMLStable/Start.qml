import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import Ubuntu.Components.Pickers 1.0
import Ubuntu.Components.Popups 1.3

Page{
    id: strona
    title: "Strona główna"
    property string startPerioid
    property bool perioid: false

    property var perioids: []

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.fill: parent


        Label {
            id: start
            visible: false
            text: "Początek okresu: " + startPerioid
        }

        Component {
            id: popoverComponent1
            Popover {
                id: popover
                Column {
                    id: containerLayout
                    anchors {
                        left: parent.left
                        top: parent.top
                        right: parent.right
                    }

                    ListItem.Header { text: "Wybierz datę" }
                    ListItem.Standard {
                        Button {
                            property date date: new Date()
                            id: dateButton
                            text : Qt.formatDateTime(date, "dddd, dd/MMMM/yyyy")
                            onClicked: PickerPanel.openDatePicker(dateButton, "date", "Days|Months|Years")
                            anchors {
                                margins: units.gu(1)
                                fill: parent
                            }
                        }

                    }



                    ListItem.Standard {
                        Button {
                            text: "Zapisz"
                            onClicked: save()
                            anchors {
                                margins: units.gu(1)
                                fill: parent
                            }

                            function save(){
                                if (perioid)
                                {
                                    var t = perioids
                                    t.push({start: startPerioid,end: dateButton.text})
                                    perioids = t


                                }
                                else{
                                    startPerioid = dateButton.text;
                                }
                                perioid = !perioid
                                start.visible = perioid
                                PopupUtils.close(popover)
                            }
                        }
                    }
                    ListItem.Standard {

                        Button {
                            text: "Anuluj"
                            onClicked: PopupUtils.close(popover)
                            anchors {
                                margins: units.gu(1)
                                fill: parent
                            }
                        }
                    }

                }
            }
        }

        Button {
            id: popoverButton1
            text:
                if(perioid){
                    return "Zakończ okres"
                }
                else{
                    return "Rozpocznij okres"
                }

            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: PopupUtils.open(popoverComponent1, popoverButton1)
            width: strona.width
        }

        Component {
            id: delegateModel
            Column {
                Label {
                    text: "start: " + modelData.start
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Label {
                    text: "koniec: " + modelData.end
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }

            ListView {
                anchors.top: popoverButton1.bottom
                anchors.bottom: parent.bottom
                model: perioids
                delegate: delegateModel

        }
    }
}
