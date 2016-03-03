import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import Ubuntu.Components.Pickers 1.0
import Ubuntu.Components.Popups 1.3

Page{
    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: units.gu(2)

        Label {
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
        }
        Button {
            id: popoverButton
            text: "Poniedziałek"
            onClicked: PopupUtils.open(popoverComponent, popoverButton)
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label {
            text: "Metoda obliczeń średniej okresu:"
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
                        ListItem.Header { text: "Metoda obliczeń średniej okresu" }
                        ListItem.Standard { text: "Wszystkie okresy" }
                        ListItem.Standard { text: "Ostatnie 5 okresów" }
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
        }
        Button {
            id: popoverButton1
            text: "Wszystkie okresy"
            onClicked: PopupUtils.open(popoverComponent1, popoverButton1)
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
