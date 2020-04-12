#ifndef MANAGER_H
#define MANAGER_H

#include <QObject>

class QPainter;
class QRect;
class QImage;

class Manager
{
public:
    ~Manager();
    static Manager* instance();
    int startManager(int argc, char** argv);

    void drawImage(QPainter *painter, const QRect &rect);
    bool openFile(const QString &path);
    void registerType();

private:
    Manager();

    QImage* p_image_;
};

#endif // MANAGER_H
