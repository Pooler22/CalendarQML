import QtQuick 2.4
import Ubuntu.Components 1.3

MainView {
    objectName: "mainView"
    applicationName: "Kalendarz intymny"

    width: units.gu(100)
    height: units.gu(75)

    Component {
            id: settingsComponent
            Page {
                title: i18n.tr("Ustawienia")
                Label {
                    anchors.centerIn: parent
                    text: i18n.tr("Ustawienia")
                }
            }
        }

        Tabs {
            id: tabs
            Tab {
                title: i18n.tr("Strona główna")
                page: Page {
                    title: i18n.tr("Strona główna")
                    anchors.fill: parent;
                    }
                    Label {
                        anchors.centerIn: parent
                        text: i18n.tr("Strona główna")
                    }
            }
            Tab {
                id: settingsTab
                title: i18n.tr("Ustawienia")
                active: true
                page: Loader {
                    // no anchors
                    id: loader
                    sourceComponent: tabs.selectedTab == settingsTab ? settingsComponent : null
                }
            }
        }
}

