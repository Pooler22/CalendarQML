import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import Ubuntu.Components.Pickers 1.0
import Ubuntu.Components.Popups 1.3

Page{
    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Dzień rozpoczynający tydzień:"
        }

        Rectangle {
            color: theme.palette.normal.background
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
                        ListItem.Standard { text: "Środa" }
                        ListItem.Standard { text: "Czwartek" }
                        ListItem.Standard { text: "Piątek" }
                        ListItem.Standard { text: "Sobota" }
                        ListItem.Standard { text: "Niedziela" }
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
                    id: popoverButton1
                    text: "Wybierz"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: PopupUtils.open(popoverComponent1, popoverButton1)
                }

            }
        }
    }
}
