import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import Ubuntu.Components.Pickers 1.0
import Ubuntu.Components.Popups 1.3

import QtQuick.Controls 1.2
import QtQuick.Controls.Private 1.0
import QtQuick.Controls.Styles 1.1

Page{

    title: "Widok miesiąca"
    property date ovulationDate: new Date()

    function fertile(dataOv)
    {
        return [
                    (new Date(dataOv.getTime()-4*(87400000))),
                    (new Date(dataOv.getTime()-3*(87400000))),
                    (new Date(dataOv.getTime()-2*(87400000))),
                    (new Date(dataOv.getTime()-1*(87400000))),
                    dataOv,
                    (new Date(dataOv.getTime()+1*(87400000))),
                    (new Date(dataOv.getTime()+2*(87400000))),
                    (new Date(dataOv.getTime()+3*(87400000))),
                    (new Date(dataOv.getTime()+4*(87400000)))]
    }

    Calendar {
        id: calendar
        weekNumbersVisible: true
        anchors.fill: parent
        style: CalendarStyle
        {
        dayDelegate: Rectangle
        {
        property bool ovulationDay: Qt.formatDateTime(ovulationDate,"dd:MM:yyyy").indexOf(Qt.formatDateTime(styleData.date,"dd:MM:yyyy")) > -1
        property variant fertileArray: fertile(ovulationDate)
        property variant fertileArrayDays:[Qt.formatDateTime(fertileArray[0],"dd:MM:yyyy").indexOf(Qt.formatDateTime(styleData.date,"dd:MM:yyyy")) > -1,
            Qt.formatDateTime(fertileArray[1],"dd:MM:yyyy").indexOf(Qt.formatDateTime(styleData.date,"dd:MM:yyyy")) > -1,
            Qt.formatDateTime(fertileArray[2],"dd:MM:yyyy").indexOf(Qt.formatDateTime(styleData.date,"dd:MM:yyyy")) > -1,
            Qt.formatDateTime(fertileArray[3],"dd:MM:yyyy").indexOf(Qt.formatDateTime(styleData.date,"dd:MM:yyyy")) > -1,
            Qt.formatDateTime(fertileArray[4],"dd:MM:yyyy").indexOf(Qt.formatDateTime(styleData.date,"dd:MM:yyyy")) > -1,
            Qt.formatDateTime(fertileArray[5],"dd:MM:yyyy").indexOf(Qt.formatDateTime(styleData.date,"dd:MM:yyyy")) > -1,
            Qt.formatDateTime(fertileArray[6],"dd:MM:yyyy").indexOf(Qt.formatDateTime(styleData.date,"dd:MM:yyyy")) > -1,
            Qt.formatDateTime(fertileArray[7],"dd:MM:yyyy").indexOf(Qt.formatDateTime(styleData.date,"dd:MM:yyyy")) > -1,
            Qt.formatDateTime(fertileArray[8],"dd:MM:yyyy").indexOf(Qt.formatDateTime(styleData.date,"dd:MM:yyyy")) > -1]
        Component.onCompleted: {
            print(styleData.date.getDate())
        }
        gradient: Gradient {
            GradientStop {
                position: 0.00
                color: styleData.selected ? "#442" : (ovulationDay ? "#CC0033" : ((fertileArrayDays[0] || fertileArrayDays[1] || fertileArrayDays[2] ||
                                                                                   fertileArrayDays[3] ||

                                                                                   fertileArrayDays[5] ||
                                                                                   fertileArrayDays[6] ||
                                                                                   fertileArrayDays[7] ||
                                                                                   fertileArrayDays[8]) ? "#FF3366" : (styleData.visibleMonth && styleData.valid ? "#444" : "#666")))
            }

            GradientStop {
                position: 1.00
                color: styleData.selected ? "#442" : (ovulationDay ?  "#CC0033" : ((fertileArrayDays[0] || fertileArrayDays[1] || fertileArrayDays[2] ||
                                                                                    fertileArrayDays[3] ||

                                                                                    fertileArrayDays[5] ||
                                                                                    fertileArrayDays[6] ||
                                                                                    fertileArrayDays[7] ||
                                                                                    fertileArrayDays[8]) && styleData.visibleMonth  ? "#FF99CC"  : (styleData.visibleMonth && styleData.valid ? "#444" : "#666")))
            }
        }

        // "#FF3366"
        Label {
            text: styleData.date.getDate()
            anchors.centerIn: parent
            color: styleData.valid ? "white" : "grey"
        }
    }
}
}
}

