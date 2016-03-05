import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem
import Ubuntu.Components.Pickers 1.0
import Ubuntu.Components.Popups 1.3


Page{
    title: "Oś czasu"

    function setRange(minValue,maxValue){
        var tmpArray = []
        for (var i = minValue; i <= maxValue; i++) {
            tmpArray.push(i)
        }
        return tmpArray
    }

    Picker {
        id: cycleDaysValue
        model: setRange(21,40)
        delegate: PickerDelegate {
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: modelData
            }
        }
    }

    Picker {
        id: perioidDaysValue
        model: setRange(3,10)
        delegate: PickerDelegate {
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: modelData
            }
        }
    }

}
