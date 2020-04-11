QT += quick

CONFIG += c++11

DEFINES += QT_DEPRECATED_WARNINGS


SOURCES += \
        MainView.cpp \
        image_view.cpp \
        interface.cpp \
        manager.cpp

RESOURCES += qml.qrc

TRANSLATIONS += \
    QPhoto_zh_CN.ts

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    image_view.h \
    interface.h \
    manager.h
