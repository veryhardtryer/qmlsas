#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <squareslist.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    QQmlContext* context = engine.rootContext();
    SquaresList sl(&app);
    context->setContextProperty("_squareList", &sl);

    engine.load(QUrl("qrc:/main.qml"));
    return app.exec();
}
