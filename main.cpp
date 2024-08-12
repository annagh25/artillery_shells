#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>

#include "database.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // Set the application icon
    app.setWindowIcon(QIcon(":/resources/images/logo.jpg"));

    // Register the DatabaseManager type with QML
    qmlRegisterType<DatabaseManager>("com.example.database", 1, 0, "DatabaseManager");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qml/Main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
