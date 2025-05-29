import QtQuick
import QtQuick.Layouts
import "../utils"

Item {
    Rectangle {
        height: clockText.height + 10
        width: clockText.width + 30
        anchors.centerIn: parent
        color: Colors.tertiary  // Beige/gold color
        radius: 20  // Rounded corners

        Text {
            id: clockText
            text: "󱑆 " + Time.time
            anchors.centerIn: parent
            font.family: Fonts.gameFont
            font.pixelSize: Fonts.gameFontSize
        }
    }
}
