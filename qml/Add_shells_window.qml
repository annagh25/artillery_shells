import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: false // Start hidden; will be shown when opened
    width: 300
    height: 200
    title: "Add Shells"

    signal shellsAdded(string shellType, int quantity)

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
                text: "Confirm Add"
                background: Rectangle {
                    color: "lightgrey"
                    radius: 5
                }
                onClicked: {
		    // Emit signal with shell type and quantity
                    shellsAdded(shellTypeDropdown.currentText, quantityField.value)
                    quantityField.value = 1; // Reset SpinBox value to 1
                    close()
                }
            }
            Button {
                text: "Cancel"
                background: Rectangle {
                    color: "lightgrey"
                    radius: 5
                }
                onClicked: {
                    quantityField.value = 1; // Reset SpinBox value to 0
                    close(); // Close the window
                }
            }
        }
    }
}
