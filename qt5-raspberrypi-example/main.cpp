#include <QtGui/QtGui>
#include <QtQuick/QtQuick>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQuickView view;

    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setSource(QUrl(QCoreApplication::applicationDirPath() + "/qml/main.qml"));
    view.show();
    return app.exec();
}

