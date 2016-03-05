import QtQuick 2.4
import Ubuntu.Components 1.3
import QtQuick.Controls 1.2
//import QtQuick.Controls.Private 1.0
import QtQuick.Controls.Styles 1.1

Page{

    title: "Widok miesiąca"
    property date ovulationDate: new Date()

    function fertile(dataOv)
    {
        var dataTime = dataOv.getTime()
        return [
                    (new Date(dataTime-4*87400000)),
                    (new Date(dataTime-3*87400000)),
                    (new Date(dataTime-2*87400000)),
                    (new Date(dataTime-1*87400000)),
                    dataOv,
                    (new Date(dataTime+1*87400000)),
                    (new Date(dataTime+2*87400000)),
                    (new Date(dataTime+3*87400000)),
                    (new Date(dataTime+4*87400000))]
    }

    Calendar {
        id: calendar
        weekNumbersVisible: true
        anchors.fill: parent
        style: CalendarStyle
        {
        dayDelegate: Rectangle
        {
        function convertDate(searchedData,styleData) {
            return Qt.formatDateTime(searchedData,"dd:MM:yyyy").indexOf(Qt.formatDateTime(styleData.date,"dd:MM:yyyy")) > -1
        }

        property bool ovulationDay: convertDate(ovulationDate, styleData)
        property variant fertileArray: fertile(ovulationDate)
        property variant fertileArrayDays:
            [
            convertDate(fertileArray[0],styleData),
            convertDate(fertileArray[1],styleData),
            convertDate(fertileArray[2],styleData),
            convertDate(fertileArray[3],styleData),
            convertDate(fertileArray[4],styleData),
            convertDate(fertileArray[5],styleData),
            convertDate(fertileArray[6],styleData),
            convertDate(fertileArray[7],styleData),
            convertDate(fertileArray[8],styleData)
        ]

        gradient: Gradient {
            GradientStop {
                position: 0.00
                color: styleData.selected ? "#442" : (ovulationDay ? "#CC0033" : ((fertileArrayDays[0] ||
                                                                                   fertileArrayDays[1] ||
                                                                                   fertileArrayDays[2] ||
                                                                                   fertileArrayDays[3] ||
                                                                                   fertileArrayDays[5] ||
                                                                                   fertileArrayDays[6] ||
                                                                                   fertileArrayDays[7] ||
                                                                                   fertileArrayDays[8]) ? "#FF3366" : (styleData.visibleMonth && styleData.valid ? "#444" : "#666")))
            }

            GradientStop {
                position: 1.00
                color: styleData.selected ? "#442" : (ovulationDay ?  "#CC0033" : ((fertileArrayDays[0] ||
                                                                                    fertileArrayDays[1] ||
                                                                                    fertileArrayDays[2] ||
                                                                                    fertileArrayDays[3] ||
                                                                                    fertileArrayDays[5] ||
                                                                                    fertileArrayDays[6] ||
                                                                                    fertileArrayDays[7] ||
                                                                                    fertileArrayDays[8]) && styleData.visibleMonth  ? "#FF99CC"  : (styleData.visibleMonth && styleData.valid ? "#444" : "#666")))
            }
        }

        Label {
            text: styleData.date.getDate()
            anchors.centerIn: parent
            color: styleData.valid ? "white" : "grey"
        }
    }
}
}
}
