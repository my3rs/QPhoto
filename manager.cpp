#include <QDebug>
#include <QPainter>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "manager.h"
#include "interface.h"
#include "image_view.h"

Manager::Manager() : p_image_(Q_NULLPTR)
{

}

Manager::~Manager()
{
    if (p_image_) {
        delete p_image_;
        p_image_ = Q_NULLPTR;
    }
}

int Manager::startManager(int argc, char **argv)
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    registerType();

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/MainView.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}

Manager* Manager::instance()
{
    static Manager mgr;
    return &mgr;
}


void Manager::drawImage(QPainter *painter, const QRect &rect)
{
    if (painter == Q_NULLPTR || rect.isEmpty())
        return;

    if (p_image_ == Q_NULLPTR)
        return;

    painter->setRenderHint(QPainter::Antialiasing, true);
    painter->setRenderHint(QPainter::HighQualityAntialiasing, true);
    painter->setRenderHint(QPainter::SmoothPixmapTransform, true);
    painter->drawImage(rect, *p_image_);
}

bool Manager::openFile(const QString &path)
{
    if (path.isEmpty())
        return false;

    if (p_image_ != Q_NULLPTR) {
        delete p_image_;
        p_image_ = Q_NULLPTR;
    }

    qDebug() << "file path: " << path;
    p_image_ = new QImage(path);

    return true;
}

void Manager::registerType()
{
    int version_major = 1;
    int version_minor = 0;

    qmlRegisterType<ImageView>("com.chris.image", version_major, version_minor, "ImageView");
    qmlRegisterType<Interface>("com.chris.image", version_major, version_minor, "Interface");
}
