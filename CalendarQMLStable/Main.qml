import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import Ubuntu.Components.Pickers 1.0
import Ubuntu.Components.Popups 1.3

MainView {
    id: mainView
    objectName: "mainView"
    applicationName: "Kalendarz intymny"
    automaticOrientation: false
    width: units.gu(50)
    height: units.gu(70)

    Tabs {
        Loader { id: start }
          Tab {
            title: "Kalendarz intymny"
            Component.onCompleted: {
              start.source = "Settings.qml"
            }
            page: start
          }

        Loader { id: month }
          Tab {
            title: "Widok miesiąca"
            Component.onCompleted: {
              month.source = "Month.qml"
            }
            page: month
          }

        Loader { id: statistics }
          Tab {
            title: "Statystyki"
            Component.onCompleted: {
              statistics.source = "Statistics.qml"
            }
            page: statistics
          }

        Loader { id: timeline }
          Tab {
            title: "Oś czasu"
            Component.onCompleted: {
              timeline.source = "Timeline.qml"
            }
            page: timeline
          }

          Loader { id: settings }
            Tab {
              title: "Ustawienia"
              Component.onCompleted: {
                settings.source = "Settings.qml"
              }
              page: settings
            }
    }
}
