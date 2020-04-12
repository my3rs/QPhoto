import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12


Item {
    id: controlView

    Action {
        id: actionUndo
        text: qsTr("Undo")
        icon.source: "/icon/undo.svg"
    }

    Action {
        id: actionRedo
        text: qsTr("Redo")
        icon.source: "/icon/redo.svg"
    }

    Rectangle {
        width: parent.width
        height: menuBar.height + toolBar.height
        color: "#e0e0e0"
    }

    MenuBar {
        id: menuBar
        font.family: notoRegular.name

        // 文件菜单
        Menu {
            id: menuFile
            title: "&File"
            font.family: notoRegular.name

            MenuItem {
                id: menuOpen
                action: Action {
                    id: actionOpen
                    text: qsTr("&Open")
                }
            }


            MenuItem {
                id: menuExit


                action: Action {
                    id: actionExit
                    text: qsTr("E&xit")
                    onTriggered: Qt.quit()
                }
            }
        }

        // 编辑菜单
        Menu {
            id: menuEdit
            title: "&Edit"
            font.family: notoRegular.name

            MenuItem {
                id: menuUndo
                action: actionUndo
            }

            MenuItem {
                id: menuRedo
                action: actionRedo
            }
        }

        // 帮助菜单
        Menu {
            id: menuHelp
            title: "&Help"
            font.family: notoRegular.name

            MenuItem {
                id: menuAbout
                text: "About QPhoto"
            }
        }
    }


    ToolBar {
        id: toolBar
        anchors.top: menuBar.bottom

        RowLayout {
            ToolButton {
                id: btnOpen

                icon.name: "open"
                icon.source: "/icon/open.svg"
            }

            ToolButton {
                id: btnUndo
                icon.name: "undo"
                icon.source: "/icon/undo.svg"
            }

            ToolButton {
                id: btnRedo
                icon.name: "redo"
                icon.source: "/icon/redo.svg"
            }
        }
    }
}
