import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import Ubuntu.Components.Pickers 1.0
import Ubuntu.Components.Popups 1.3

Page{
    title: "Strona główna"
    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        Rectangle {
            width: units.gu(10)
            height: units.gu(10)
            color: "red"
            anchors {
                margins: units.gu(2)
            }
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            color: theme.palette.normal.background
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
                        ListItem.Header { text: "Wybierz datę:" }
                        ListItem.Standard {
                            Button {
                                property date date: new Date()
                                id: dateButton
                                text : "Ustaw datę"
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
                                anchors {
                                    margins: units.gu(1)
                                    fill: parent
                                }

                            }
                        }
                        ListItem.Standard {

                            Button {
                                text: "Anuluj"
                                anchors {
                                    margins: units.gu(1)
                                    fill: parent
                                }
                            }
                        }
                    }
                }
            }
        }
        Button {
            id: popoverButton1
            text: "Wybierz"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: PopupUtils.open(popoverComponent1, popoverButton1)
        }

            ListModel {
                id: contactModel
                ListElement {
                    name: "Wydarzenie"
                    day: "2"
                }
                ListElement {
                    name: "Wydarzenie"
                    day: "12"
                }
                ListElement {
                    name: "Wydarzenie"
                    day: "14"
                }
            }

            UbuntuListView {
                width: 180; height: 200

                model: contactModel
                delegate: Text {
                    text: name + " za " + day + " dni"
                }
                anchors {
                    margins: units.gu(1)
                }
            }

    }
}