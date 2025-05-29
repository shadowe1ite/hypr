import Quickshell
import QtQuick
import QtQuick.Layouts
import "../modules"
import "../modules/workspaces"
import "../utils"

Scope {
    Variants {
        model: Quickshell.screens

        delegate: Component {
            PanelWindow {
                id: barWindow
                property var modelData
                screen: modelData

                implicitHeight: 52
                color: "transparent"
                anchors {
                    top: false
                    bottom: true
                    left: true
                    right: true
                }

                // Main bar
                Rectangle {
                    id: bar
                    anchors.right: parent.right
                    anchors.left: parent.left
                    anchors.top: parent.top

                    //anchors.fill: parent
                    anchors.centerIn: parent
                    height: 52
                    width: parent.width / 4
                    color: Colors.surface
                    border.width: 3
                    border.color: Colors.primary
                    radius: 20

                    // Bar Left
                    RowLayout {
                        id: barLeft
                    }

                    // Bar Center
                    RowLayout {
                        id: barCenter
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        Clock {}
                    }

                    // Bar Right
                    RowLayout {
                        id: barRight

                        anchors.bottom: parent.bottom
                        anchors.top: parent.top
                        anchors.left: parent.right
                        Clock {}
                        width: parent.width / 8
                    }
                }
            }
        }
    }
}
