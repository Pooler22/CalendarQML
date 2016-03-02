import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import Ubuntu.Components.Pickers 1.0
import Ubuntu.Components.Popups 1.3



/*!
    \brief MainView with Tabs element.
           First Tab has a single Label and
           second Tab has a single ToolbarAction.
*/

MainView {
    id: mainView
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "nienazwany3.username"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true


    width: units.gu(100)
    height: units.gu(75)

    Tabs {
        Tab {
            title: "Strona główna"
            Page{
                title: "Strona główna"
                Column {
                    anchors.horizontalCenter: parent.horizontalCenter
                    Rectangle {
                        width: units.gu(10)
                        height: units.gu(10)
                        color: "red"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }


                        Button {
                            property date date: new Date()
                            id: dateButton
                            text : "Ustaw datę"
                            onClicked: PickerPanel.openDatePicker(dateButton, "date", "Days|Months|Years")
                        }

                        Button {
                            text : "Ustaw początek okresu"
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
                        }

                }
            }


        }
        Tab {
            title: "Widok miesiąca"
            Page{
                 title: "Widok miesiąca"
                 Rectangle { color: "blue"
                     width: units.gu(100)
                     height: units.gu(75)}
            }


        }
        Tab {
            title: "Statystyki"
            Page{
                title: "Statystyki"
                Rectangle { color: "green"
                    width: units.gu(100)
                    height: units.gu(75)
                }
            }


        }
        Tab {
            title: "Oś czasu"
            Page{
                title: "Oś czasu"
                Rectangle { color: "green"
                    width: units.gu(100)
                    height: units.gu(75)
                }
            }


        }

        Tab {
            title: "Ustawienia"
            page: Page{
            Column {
                anchors.horizontalCenter: parent.horizontalCenter
                Label {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Dzień rozpoczynający tydzień:"
                }


                Rectangle {
                    color: theme.palette.normal.background
                    width: units.gu(80)
                    height: units.gu(80)
                    Component {
                        id: popoverComponent
                        Popover {
                            id: popover
                            Column {
                                id: containerLayout
                                anchors {
                                    left: parent.left
                                    top: parent.top
                                    right: parent.right
                                }
                                ListItem.Header { text: "Wybierz pierwszy dzień tygodnia" }
                                ListItem.Standard { text: "Poniedziałek" }
                                ListItem.Standard { text: "Wtorek" }
                                ListItem.Standard { text: "Wtorek" }
                                ListItem.Standard { text: "Wtorek" }
                                ListItem.Standard { text: "Wtorek" }
                                ListItem.Standard { text: "Wtorek" }
                                ListItem.Standard { text: "Wtorek" }
                                ListItem.SingleControl {
                                    highlightWhenPressed: false
                                    control: Button {
                                        text: "Do nothing"
                                        anchors {
                                            fill: parent
                                            margins: units.gu(1)
                                        }
                                    }
                                }
                                ListItem.SingleControl {
                                    highlightWhenPressed: false
                                    control: Button {
                                        text: "Close"
                                        anchors {
                                            fill: parent
                                            margins: units.gu(1)
                                        }
                                        onClicked: PopupUtils.close(popover)
                                    }
                                }
                            }
                        }
                    }
                    Button {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: popoverButton
                        text: "Wybierz"
                        onClicked: PopupUtils.open(popoverComponent, popoverButton)
                    }

                    Label {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Wybierz motodę obliczeń:"
                    }


                    Rectangle {
                        color: theme.palette.normal.background
                        width: units.gu(80)
                        height: units.gu(80)
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
                                    ListItem.Header { text: "Wybierz motodę obliczeń" }
                                    ListItem.Standard { text: "Na podstawie wszystkich okresów" }
                                    ListItem.Standard { text: "Na podstawie ostatnich 5 okresów" }
                                    ListItem.SingleControl {
                                        highlightWhenPressed: false
                                        control: Button {
                                            text: "Do nothing"
                                            anchors {
                                                fill: parent
                                                margins: units.gu(1)
                                            }
                                        }
                                    }
                                    ListItem.SingleControl {
                                        highlightWhenPressed: false
                                        control: Button {
                                            text: "Close"
                                            anchors {
                                                fill: parent
                                                margins: units.gu(1)
                                            }
                                            onClicked: PopupUtils.close(popover)
                                        }
                                    }
                                }
                            }
                        }
                        Button {
                            anchors.horizontalCenter: parent.horizontalCenter
                            id: popoverButton1
                            text: "Wybierz"
                            onClicked: PopupUtils.open(popoverComponent1, popoverButton1)
                        }

            }
}}
        }}
    }
}

