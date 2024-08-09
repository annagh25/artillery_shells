import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 450 // Adjusted width to match the table width
    height: 260 // Adjusted height to fit the table and buttons
    title: "Artillery Inventory Management"

    Column {
        spacing: 10
        anchors.centerIn: parent

        // Table
        ColumnLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 0

            // Title as the first line of the table
            Row {
                spacing: 0
                Rectangle {
                    width: 450
                    height: 30
                    color: "#B0BEC5" // Grey color for header
                    border.color: "black"
                    Text {
                        text: "Artillery Inventory"
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
                        text: "Shell Type"
                        font.bold: true
                        color: "black"
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: 100
                    height: 30
                    color: "#B0BEC5" // Grey color for header
                    border.color: "black"
                    Text {
                        text: "In Stock"
                        font.bold: true
                        color: "black"
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: 100
                    height: 30
                    color: "#B0BEC5" // Grey color for header
                    border.color: "black"
                    Text {
                        text: "Used"
                        font.bold: true
                        color: "black"
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: 100
                    height: 30
                    color: "#B0BEC5" // Grey color for header
                    border.color: "black"
                    Text {
                        text: "Total"
                        font.bold: true
                        color: "black"
                        anchors.centerIn: parent
                    }
                }
            }

            // Table Rows
            Row {
                spacing: 0
                Rectangle {
                    width: 150
                    height: 30
                    border.color: "black"
                    Text {
                        text: "60mm"
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: 100
                    height: 30
                    border.color: "black"
                    Text {
                        text: "50"
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: 100
                    height: 30
                    border.color: "black"
                    Text {
                        text: "10"
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: 100
                    height: 30
                    border.color: "black"
                    Text {
                        text: "60"
                        anchors.centerIn: parent
                    }
                }
            }
            Row {
                spacing: 0
                Rectangle {
                    width: 150
                    height: 30
                    border.color: "black"
                    Text {
                        text: "82mm"
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: 100
                    height: 30
                    border.color: "black"
                    Text {
                        text: "30"
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: 100
                    height: 30
                    border.color: "black"
                    Text {
                        text: "5"
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: 100
                    height: 30
                    border.color: "black"
                    Text {
                        text: "35"
                        anchors.centerIn: parent
                    }
                }
            }
            Row {
                spacing: 0
                Rectangle {
                    width: 150
                    height: 30
                    border.color: "black"
                    Text {
                        text: "100mm"
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: 100
                    height: 30
                    border.color: "black"
                    Text {
                        text: "20"
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: 100
                    height: 30
                    border.color: "black"
                    Text {
                        text: "2"
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: 100
                    height: 30
                    border.color: "black"
                    Text {
                        text: "22"
                        anchors.centerIn: parent
                    }
                }
            }
            Row {
                spacing: 0
                Rectangle {
                    width: 150
                    height: 30
                    border.color: "black"
                    Text {
                        text: "122mm"
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: 100
                    height: 30
                    border.color: "black"
                    Text {
                        text: "15"
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: 100
                    height: 30
                    border.color: "black"
                    Text {
                        text: "3"
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: 100
                    height: 30
                    border.color: "black"
                    Text {
                        text: "18"
                        anchors.centerIn: parent
                    }
                }
            }
            Row {
                spacing: 0
                Rectangle {
                    width: 150
                    height: 30
                    border.color: "black"
                    Text {
                        text: "152mm"
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: 100
                    height: 30
                    border.color: "black"
                    Text {
                        text: "10"
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: 100
                    height: 30
                    border.color: "black"
                    Text {
                        text: "1"
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    width: 100
                    height: 30
                    border.color: "black"
                    Text {
                        text: "11"
                        anchors.centerIn: parent
                    }
                }
            }
        }

        // Buttons
        Row {
            spacing: 20
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            Button {
                text: "Add Shells"
                background: Rectangle {
                    color: "#D0D0D0" // Light grey color for buttons
                    border.color: "black"
                    implicitWidth: childrenRect.width // Automatically adjust width to fit text
                    implicitHeight: height // Use button's height
                }
                onClicked: {
                    add_loader.active = true // Activate the loader to load and show the Add Shells window
                    add_loader.item.visible = true // Make the loaded window visible
                }
            }
            Button {
                text: "Remove Shells"
                background: Rectangle {
                    color: "#D0D0D0" // Light grey color for buttons
                    border.color: "black"
                    implicitWidth: childrenRect.width // Automatically adjust width to fit text
                    implicitHeight: height // Use button's height
                }
                onClicked: {
                    remove_loader.active = true // Activate the loader to load and show the Add Shells window
                    remove_loader.item.visible = true // Make the loaded window visible
                }
            }
            Button {
                text: "History"
                background: Rectangle {
                    color: "#D0D0D0" // Light grey color for buttons
                    border.color: "black"
                    implicitWidth: childrenRect.width // Automatically adjust width to fit text
                    implicitHeight: height // Use button's height
                }
                onClicked: {
                    history_loader.active = true // Activate the loader to load and show the Add Shells window
                    history_loader.item.visible = true // Make the loaded window visible
                }
            }
        }
        // Loader for Add Shells window
        Loader {
            id: add_loader
            source: "Add_shells_window.qml"
            active: false // Start inactive
            onLoaded: {
                item.visible = false // Keep it hidden initially
            }
        }

        Loader {
            id: remove_loader
            source: "Remove_shells_window.qml"
            active: false // Start inactive
            onLoaded: {
                item.visible = false // Keep it hidden initially
            }
        }

        Loader {
            id: history_loader
            source: "History_window.qml"
            active: false // Start inactive
            onLoaded: {
                item.visible = false // Keep it hidden initially
            }
        }
    }
}
