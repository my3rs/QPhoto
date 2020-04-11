import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12


Item {
    id: controlView

    MenuBar {
        id: menuBar

        // 文件菜单
        Menu {
            id: menuFile
            title: "File"

            MenuItem {
                id: menuOpen
                text: "Open"
            }


            MenuItem {
                id: menuExit
                text: "Exit"
            }
        }

        // 编辑菜单
        Menu {
            id: menuEdit
            title: "Edit"

            MenuItem {
                id: menuUndo
                text: "Undo"
            }

            MenuItem {
                id: menuRedo
                text: "Redo"
            }
        }

        // 帮助菜单
        Menu {
            id: menuHelp
            title: "Help"

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
//                text: "Open"
                icon.name: "open"
                icon.source: "/img/icon/open.svg"
            }

            ToolButton {
                id: btnUndo
                text: "Undo"
            }

            ToolButton {
                id: btnRedo
                text: "Redo"
            }
        }
    }
}
