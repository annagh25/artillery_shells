import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 450 // Adjusted width to match the table width
    height: 260 // Adjusted height to fit the table and buttons
    title: "Artillery Inventory Management"

    // Inventory model
    ListModel {
        id: inventoryModel
        ListElement { shellType: "60mm"; inStock: 50; used: 10 }
        ListElement { shellType: "82mm"; inStock: 30; used: 5 }
        ListElement { shellType: "100mm"; inStock: 20; used: 2 }
        ListElement { shellType: "122mm"; inStock: 15; used: 3 }
        ListElement { shellType: "152mm"; inStock: 10; used: 1 }
    }

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

            // Dynamic Table Rows
            ListView {
                width: 450
                height: 150
                model: inventoryModel
                delegate: Row {
                    spacing: 0
                    Rectangle {
                        width: 150
                        height: 30
                        border.color: "black"
                        Text {
                            text: model.shellType
                            anchors.centerIn: parent
                        }
                    }
                    Rectangle {
                        width: 100
                        height: 30
                        border.color: "black"
                        Text {
                            text: model.inStock
                            anchors.centerIn: parent
                        }
                    }
                    Rectangle {
                        width: 100
                        height: 30
                        border.color: "black"
                        Text {
                            text: model.used
                            anchors.centerIn: parent
                        }
                    }
                    Rectangle {
                        width: 100
                        height: 30
                        border.color: "black"
                        Text {
                            text: model.inStock + model.used
                            anchors.centerIn: parent
                        }
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
                }
                onClicked: {
                    remove_loader.active = true // Activate the loader to load and show the Remove Shells window
                    remove_loader.item.visible = true // Make the loaded window visible
                }
            }
            Button {
                text: "History"
                background: Rectangle {
                    color: "#D0D0D0" // Light grey color for buttons
                    border.color: "black"
                }
                onClicked: {
                    history_loader.active = true // Activate the loader to load and show the History window
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
                // Handle the signal emitted by Add_shells_window.qml
                item.shellsAdded.connect(function(shellType, quantity) {
                    for (var i = 0; i < inventoryModel.count; ++i) {
                        var item = inventoryModel.get(i)
                        if (item.shellType === shellType) {
                            inventoryModel.set(i, {
                                shellType: item.shellType,
                                inStock: item.inStock + quantity,
                                used: item.used
                            })
                            return
                        }
                    }
                })
            }
        }

        // Loader for Remove Shells window
        Loader {
            id: remove_loader
            source: "Remove_shells_window.qml"
            active: false // Start inactive
            onLoaded: {
                item.visible = false // Keep it hidden initially
                // Ensure the signal connection is established correctly
                item.shellsRemoved.connect(function(shellType, quantity) {
                    for (var i = 0; i < inventoryModel.count; ++i) {
                        var item = inventoryModel.get(i)
                        if (item.shellType === shellType) {
                            if (item.inStock >= quantity) {
                                inventoryModel.set(i, {
                                    shellType: item.shellType,
                                    inStock: Math.max(0, item.inStock - quantity),
                                    used: item.used + quantity
                                })
                                return
                            }
			    //TODO: Add error box for wrong remove
                        }
                    }
                })
            }
        }

        // Loader for History window
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
