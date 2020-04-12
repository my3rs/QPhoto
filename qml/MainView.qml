import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12


import com.chris.image 1.0


Window {
    id: mainWindow
    visible: true
    width: 960
    height: 720
    title: qsTr("QPhoto")

    flags: Qt.FramelessWindowHint | Qt.Window

    FontLoader {
        id: notoRegular
        source: "/font/NotoSans-Regular.ttf"
    }


    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        // 标题栏
        Rectangle {
            id: titleBar
            Layout.fillWidth: parent
            implicitHeight: 40
            color: "darkgray"

            RowLayout {
                anchors.fill: parent
                spacing: 2

                MouseArea {
                    id: mouseControler

                    property point clickPos: "0,0"

                    Layout.fillHeight: parent
                    Layout.fillWidth: parent


                    // 标题
                    Text {
                        text: qsTr("QPhoto")
                        font.family: notoRegular.name
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 10
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                    }

                    onPressed: {
                        clickPos = Qt.point(mouse.x, mouse.y)
                    }

                    onPositionChanged: {
                        var delta = Qt.point(mouse.x - clickPos.x, mouse.y - clickPos.y)
                        mainWindow.setX(mainWindow.x + delta.x)
                        mainWindow.setY(mainWindow.y + delta.y)
                    }
                }

                // 关闭按钮
                MouseArea {
                    id: closeBtn
                    Layout.fillHeight: parent
                    implicitWidth: 45

                    Rectangle {
                        anchors.fill: parent
                        color: "red"
                    }

                    onClicked: {
                        Qt.quit()
                    }
                }
            }
        }

        // 内容框
        Rectangle {
            id: contentView
            Layout.fillWidth: parent
            Layout.fillHeight: parent
            color: "lightgray"

            ControlView {
                id: controlView

                width: parent.width
                height: 80
            }

            DropArea {
                width: parent.width
                height: parent.height

                onEntered: {
                    if (drag.urls.length !== 1) {
                        drag.accepted = false;
                        return false;
                    }
                }

                onDropped: {
                    if (drop.hasUrls) {
                        // get the first file
                        var filePath = drop.urls[0];
                        if (filePath.indexOf("file:///") === 0) {
                            filePath = filePath.replace("file:///", "");
                        }
                        _interface.openFile(filePath)
                        mainView.imageEvent("redrawImage")
                    }
                }
            }

            QPhotoView {
                id: mainView;
                width: parent.width
                height: parent.height - controlView.height

                anchors.top: controlView.bottom

            }
        }

        // 信息栏
        Rectangle {
            id: infoBar
            Layout.fillWidth: parent
            implicitHeight: 30
            color: "darkgray"
        }
    }



    Interface {
        id: _interface;
    }



}


