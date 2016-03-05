import QtQuick 2.4
import Ubuntu.Components 1.3
import "storage.js" as Storage

MainView {
    id: mainView
    objectName: "mainView"
    automaticOrientation: false
    width: units.gu(50)
    height: units.gu(70)

    Loader { id: start }
    Loader { id: month }
    Loader { id: statistics }
    Loader { id: timeline }
    Loader { id: settings }
    Loader { id: welcome }

    Tabs {
        Tab {
            title: "Kalendarz intymny"
            Component.onCompleted: {

                start.source = "Start.qml"

            }
            page: start
        }


        Tab {
            title: "Widok miesiąca"
            Component.onCompleted: {
                month.source = "próba.qml"
            }
            page: month
        }

        Tab {
            title: "Statystyki"
            Component.onCompleted: {
                statistics.source = "Statistics.qml"
            }
            page: statistics
        }

        Tab {
            title: "Oś czasu"
            Component.onCompleted: {
                timeline.source = "Timeline.qml"
            }
            page: timeline
        }

        Tab {
            title: "Ustawienia"
            Component.onCompleted: {
                settings.source = "Settings.qml"
            }
            page: settings
        }

        Tab {
            title: "Welcome"
            Component.onCompleted: {
                welcome.source = "Welcome.qml"
            }
            page: welcome
        }
    }
}
