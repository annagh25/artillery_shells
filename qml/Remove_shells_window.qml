import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: removeShellsWindow
    visible: false // Start hidden; will be shown when opened
    width: 300
    height: 200
    title: "Remove Shells"

    property var dbManager // Add a property for dbManager
    signal shellsRemoved(string shellType, int quantity)

    Column {
        spacing: 20
        anchors.centerIn: parent

        // Shell Type Row
        Row {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                text: "Shell Type:"
                font.bold: true
                width: 80
                horizontalAlignment: Text.AlignRight
            }
            ComboBox {
                id: shellTypeDropdown
                model: ["60mm", "82mm", "100mm", "122mm", "152mm"]
                width: 150
            }
        }

        // Quantity Row
        Row {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                text: "Quantity:"
                font.bold: true
                width: 80
                horizontalAlignment: Text.AlignRight
            }
            SpinBox {
                id: quantityField
                from: 1
                to: 1000
                width: 150
                value: 1
                editable: true // Enable direct input
            }
        }

        // Buttons Row
        Row {
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter
            Button {
                text: "Confirm Remove"
                background: Rectangle {
                    color: "lightgrey"
                    radius: 5
                }
                onClicked: {
                    var selectedShellType = shellTypeDropdown.currentText;
                    var quantity = quantityField.value;

                    // Emit signal with shell type and quantity
                    shellsRemoved(selectedShellType, quantity);

                    if (dbManager) {
                        // Call the DatabaseManager method to remove shells
                        dbManager.removeEntry(selectedShellType, quantity);
                        dbManager.addHistory(selectedShellType, quantity, "Remove"); // Corrected line
                    } else {
                        console.error("dbManager is not defined!");
                    }

                    quantityField.value = 1; // Reset SpinBox value to 1
                    close(); // Close the window after removing
                }
            }
            Button {
                text: "Cancel"
                background: Rectangle {
                    color: "lightgrey"
                    radius: 5
                }
                onClicked: {
                    quantityField.value = 1; // Reset SpinBox value to 1
                    close(); // Close the window
                }
            }
        }
    }
}
