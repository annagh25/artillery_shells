#ifndef DATABASEMANAGER_H
#define DATABASEMANAGER_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QDateTime>
#include <QVariantList>

class DatabaseManager : public QObject
{
    Q_OBJECT

public:
    explicit DatabaseManager(QObject *parent = nullptr);
    ~DatabaseManager();

    Q_INVOKABLE void addEntry(const QString &shellType, int quantity);
    Q_INVOKABLE void removeEntry(const QString &shellType, int quantity);
    Q_INVOKABLE void addHistory(const QString& shellType, int quantity, const QString& action); // Marked as Q_INVOKABLE
    Q_INVOKABLE QVariantList getHistory();

private:
    QSqlDatabase db;
    bool initializeDatabase();
};

#endif // DATABASEMANAGER_H
