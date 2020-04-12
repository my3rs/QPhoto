#include "Interface.h"
#include "Manager.h"


Interface::Interface(QObject *parent) : QObject(parent)
{

}

bool Interface::openFile(const QString& path)
{
    return Manager::instance()->openFile(path);
}
