import QtQuick 2.12
import QtQuick.Window 2.12


import com.chris.image 1.0


Window {
    visible: true
    width: 640
    height: 560
    title: qsTr("QPhoto")


    ControlView {
        id: controlView

        width: parent.width
        height: 80
    }

    Interface {
        id: _interface;
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


