import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import com.example.database 1.0

ApplicationWindow {
    visible: true
    width: 450
    height: 300
    title: "Artillery History Management"

    // The DatabaseManager instance is passed from Main.qml
    property var dbManager: null

    // Model to store history data
    ListModel {
        id: historyModel
    }

    // Function to load history data from the database
    function loadHistory() {
        // Clear the current model
        historyModel.clear();

        // Check if dbManager is defined
        if (dbManager) {
            // Get the history data from the database
            var historyData = dbManager.getHistory();

            // Populate the model with the retrieved data
            for (var i = 0; i < historyData.length; i++) {
                historyModel.append({
                    "dateTime": historyData[i]["dateTime"],
                    "action": historyData[i]["action"],
                    "shell": historyData[i]["shell"],
                    "qty": historyData[i]["qty"]
                });
            }
        } else {
            console.error("dbManager is not defined");
        }
    }

    Component.onCompleted: {
        loadHistory(); // Load the history when the window is opened
    }

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

        // ListView for dynamic rows with scrolling
        ListView {
            id: historyListView
            model: historyModel // This should be your model for displaying history
            width: 450
            height: 180 // Adjust height to fit within the window
            clip: true // Clip the content to the bounds of the ListView
            delegate: Row {
                spacing: 0
                width: historyListView.width // Match the width of the ListView
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

        // Buttons
        Row {
            spacing: 20
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            Button {
                text: "Back to Inventory"
                onClicked: {
                    close(); // Close the history window
                }
            }
        }
    }
}
