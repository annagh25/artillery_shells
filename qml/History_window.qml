import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 450
    height: 250
    title: "Artillery History Management"

    Column {
        spacing: 10
        anchors.centerIn: parent

        // Title as the first line of the table
        Row {
            spacing: 0
            Rectangle {
                width: 450
                height: 30
                color: "#B0BEC5" // Grey color for header
                border.color: "black"
                Text {
                    text: "Inventory History"
                    font.bold: true
                    color: "black"
                    anchors.centerIn: parent
                }
            }
        }

        // Table Header
        Row {
            spacing: 0
            Rectangle {
                width: 150
                height: 30
                color: "#B0BEC5" // Grey color for header
                border.color: "black"
                Text {
                    text: "Date/Time"
                    font.bold: true
                    color: "black"
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                width: 100
                height: 30
                color: "#B0BEC5"
                border.color: "black"
                Text {
                    text: "Action"
                    font.bold: true
                    color: "black"
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                width: 100
                height: 30
                color: "#B0BEC5"
                border.color: "black"
                Text {
                    text: "Shell"
                    font.bold: true
                    color: "black"
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                width: 100
                height: 30
                color: "#B0BEC5"
                border.color: "black"
                Text {
                    text: "Qty"
                    font.bold: true
                    color: "black"
                    anchors.centerIn: parent
                }
            }
        }

        // Repeater for dynamic rows
        Repeater {
            id: historyRepeater
            model: ListModel { // Example model, replace with your database query results
                ListElement { dateTime: "2024-08-01 10:00:00"; action: "Add"; shell: "60mm"; qty: 10 }
                ListElement { dateTime: "2024-08-01 09:00:00"; action: "Remove"; shell: "82mm"; qty: 5 }
                ListElement { dateTime: "2024-07-31 12:00:00"; action: "Add"; shell: "100mm"; qty: 20 }
            }

            delegate: Row {
                spacing: 0
                Rectangle {
                    width: 150
                    height: 30
                    border.color: "black"
                    Text {
                        text: model.dateTime
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: 100
                    height: 30
                    border.color: "black"
                    Text {
                        text: model.action
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: 100
                    height: 30
                    border.color: "black"
                    Text {
                        text: model.shell
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: 100
                    height: 30
                    border.color: "black"
                    Text {
                        text: model.qty
                        anchors.centerIn: parent
                    }
                }
            }
        }

        // Filter Section
        /*Row {
            spacing: 10
            Rectangle {
                width: 250
                height: 30
                color: "#D0D0D0" // Light grey for dropdown
                border.color: "black"
                Text {
                    text: "Filter by Shell Type"
                    anchors.centerIn: parent
                }
            }
            ComboBox {
                width: 100
                model: ["All", "60mm", "82mm", "100mm", "122mm", "152mm"]
            }
        }*/

        // Buttons
        Row {
            spacing: 20
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            Button {
                text: "Back to Inventory"
                background: Rectangle {
                    color: "#D0D0D0" // Light grey color for buttons
                    border.color: "black"
                    implicitWidth: childrenRect.width
                    implicitHeight: height
                }
                onClicked: {
                    // Add functionality to go back to inventory
                }
            }
        }
    }
}
