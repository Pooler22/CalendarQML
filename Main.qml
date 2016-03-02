import QtQuick 2.4
import Ubuntu.Components 1.3


/*!
    \brief MainView with Tabs element.
           First Tab has a single Label and
           second Tab has a single ToolbarAction.
*/

MainView {
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
                Rectangle {
                    width: units.gu(100)
                    height: units.gu(75)
                    color: "red" }
            }


        }
        Tab {
            title: "Widok miesiąca"
            Page{
                 title: "Blue"
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
            Page{
                title: "Ustawienia"
                Rectangle { color: "green"
                    width: units.gu(100)
                    height: units.gu(75)
                }
            }


        }
    }
}

