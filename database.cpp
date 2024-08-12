#include "database.h"

DatabaseManager::DatabaseManager(QObject *parent)
    : QObject(parent)
{
    if (!initializeDatabase()) {
        qDebug() << "Failed to initialize the database!";
    }
}

DatabaseManager::~DatabaseManager()
{
    if (db.isOpen()) {
        db.close();
    }
}

bool DatabaseManager::initializeDatabase()
{
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("artillery_inventory.db");

    if (!db.open()) {
        qDebug() << "Error: Could not open database." << db.lastError().text();
        return false;
    }

    // Create the table if it doesn't exist
    QSqlQuery query;
    QString createTableQuery = R"(
        CREATE TABLE IF NOT EXISTS inventory_history (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            date_time TEXT,
            action_type TEXT,
            shell_type TEXT,
            quantity INTEGER
        )
    )";

    if (!query.exec(createTableQuery)) {
        qDebug() << "Error: Failed to create table." << query.lastError().text();
        return false;
    }

    return true;
}

void DatabaseManager::addEntry(const QString &shellType, int quantity)
{
    QSqlQuery query;
    query.prepare("INSERT INTO inventory_history (date_time, action_type, shell_type, quantity) VALUES (datetime('now'), 'Add', :shellType, :quantity)");
    query.bindValue(":shellType", shellType);
    query.bindValue(":quantity", quantity);

    if (!query.exec()) {
        qDebug() << "Error: Failed to insert entry." << query.lastError().text();
    }

    addHistory(shellType, quantity, "Add");
}

void DatabaseManager::removeEntry(const QString &shellType, int quantity)
{
    QSqlQuery query;
    query.prepare("INSERT INTO inventory_history (date_time, action_type, shell_type, quantity) VALUES (datetime('now'), 'Remove', :shellType, :quantity)");
    query.bindValue(":shellType", shellType);
    query.bindValue(":quantity", quantity);

    if (!query.exec()) {
        qDebug() << "Error: Failed to insert entry." << query.lastError().text();
    }

    addHistory(shellType, quantity, "Remove");
}

void DatabaseManager::addHistory(const QString& shellType, int quantity, const QString& action) {
    QSqlQuery query;
    query.prepare("INSERT INTO inventory_history (date_time, action_type, shell_type, quantity) VALUES (?, ?, ?, ?)");
    query.addBindValue(QDateTime::currentDateTime().toString("yyyy-MM-dd HH:mm:ss")); // Current date/time
    query.addBindValue(action);
    query.addBindValue(shellType);
    query.addBindValue(quantity);

    if (!query.exec()) {
        qDebug() << "Error inserting history record:" << query.lastError();
    }
}


QVariantList DatabaseManager::getHistory() {
    QVariantList historyList;
    QSqlQuery query("SELECT date_time, action_type, shell_type, quantity FROM inventory_history ORDER BY date_time DESC");

    while (query.next()) {
        QVariantMap record;
        record["dateTime"] = query.value("date_time").toString();
        record["action"] = query.value("action_type").toString();
        record["shell"] = query.value("shell_type").toString();
        record["qty"] = query.value("quantity").toInt();
        historyList.append(record);
    }

    return historyList;
}
