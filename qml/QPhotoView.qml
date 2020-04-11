import QtQuick 2.12

import com.chris.image 1.0

Item {
    id: mainView

    signal imageEvent(string params)

    ImageView {
        id: imageView
        view_id_: 0
        width: parent.width
        height: parent.height
    }

    onImageEvent: {
        if (params == "redrawImage") {
            imageView.signalRedraw();
        }
    }

}
