QT += quick

CONFIG += c++11

DEFINES += QT_DEPRECATED_WARNINGS


SOURCES += \
        ImageView.cpp \
        Interface.cpp \
        MainView.cpp \
        Manager.cpp

RESOURCES += \
    resource.qrc

TRANSLATIONS += \
    QPhoto_zh_CN.ts

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    ImageView.h \
    Interface.h \
    Manager.h
