#ifndef INTERFACE_H
#define INTERFACE_H

#include <QObject>

class Interface : public QObject
{
    Q_OBJECT
public:
    explicit Interface(QObject *parent = nullptr);


public slots:
    bool openFile(const QString &path);

};

#endif // INTERFACE_H
