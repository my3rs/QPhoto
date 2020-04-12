#include "ImageView.h"
#include "Manager.h"

ImageView::ImageView(QQuickItem *parent) :
    QQuickPaintedItem(parent),
    view_id_(-1)
{
    connect(this, SIGNAL(signalRedraw()),
                this, SLOT(update()));
}

ImageView::~ImageView()
{

}

void ImageView::paint(QPainter * painter)
{
    Manager::instance()->drawImage(painter, QRect(0, 0, this->width(), this->height()));
}

int ImageView::view_id()
{
    return view_id_;
}

void ImageView::set_view_id(int view_id)
{
    this->view_id_ = view_id;
}
