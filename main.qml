import QtQuick 2.15
import QtQuick.Window 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0

Window {
    width: 400
    height: 400
    visible: true
    title: "List issue"

    ListModel {
        id: listmodel
        ListElement { index: 1; pressed: false }
        ListElement { index: 2; pressed: false }
        ListElement { index: 3; pressed: false }
        ListElement { index: 4; pressed: false }
    }

    GridLayout {
        id: grid
        anchors.centerIn: parent
        columns: 2
        rows: 2

        property var selectedSquares: _squareList.selectedSquares

        Repeater {
            Layout.fillHeight: true
            Layout.fillWidth: true
            model: listmodel

            delegate: Rectangle {
                implicitWidth: 100
                implicitHeight: 100

                color: model.pressed ? "lightblue" : "grey"
                Text {
                    anchors.centerIn: parent
                    text: model.index
                }

                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        if(model.pressed) {
                            grid.selectedSquares.splice(
                                grid.selectedSquares.indexOf(model.index), 1)
                        } else {
                            grid.selectedSquares.push(model.index)
                        }
                        model.pressed = !model.pressed
                    }
                }
            }
       }

    }

    Button {
        anchors {
            bottom: parent.bottom
            bottomMargin: 10
            horizontalCenter: parent.horizontalCenter
        }

        width: 150
        height: 80
        background: Rectangle {
            color: "lightgreen"
            Text {
                anchors.centerIn: parent
                text: "Add"
            }
        }

        visible: {
            return grid.selectedSquares.length > 0
        }
    }
}
