#ifndef IMAGEVIEW_H
#define IMAGEVIEW_H

#include <QQuickPaintedItem>

class ImageView : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(int view_id_ READ view_id WRITE set_view_id NOTIFY viewIdChanged)

public:
    ImageView(QQuickItem *parent = 0);
    virtual ~ImageView();

    virtual void paint(QPainter *painter);

    int view_id();
    void set_view_id(int view_id);

signals:
    void signalRedraw();
    void viewIdChanged();

private:
    int view_id_;
};

#endif // IMAGEVIEW_H
