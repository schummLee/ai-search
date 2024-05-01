#include "../include/MySQLConnector.h"

namespace sql {

MySQLConnector::MySQLConnector(
    const std::string& host, 
    const std::string& user, 
    const std::string& password, 
    const std::string& database
    )
    : driver(nullptr), con(nullptr), host_(host), user_(user), password_(password), database_(database), connected_(false) {}

MySQLConnector::~MySQLConnector() {
    if (con && connected_) {
        con->close();
    }
}

bool MySQLConnector::connect() {
    try {
        driver = sql::mysql::get_mysql_driver_instance();
        con.reset(driver->connect(host_, user_, password_));
        con->setSchema(database_);
        connected_ = true;
        return true;
    } catch (const SQLException& e) {
        std::cerr << "SQL Error: " << e.what() << std::endl;
        return false;
    }
}

bool MySQLConnector::isConnected() {
    return connected_;
}

sql::ResultSet* MySQLConnector::executeQuery(const std::string& query) {
    if (!connected_) {
        std::cerr << "Not connected to the database." << std::endl;
        return nullptr;
    }
    try {
        sql::Statement* stmt = con->createStatement();
        sql::ResultSet* res = stmt->executeQuery(query);
        delete stmt; // Cleanup statement
        return res;
    } catch (const SQLException& e) {
        std::cerr << "SQL Error: " << e.what() << std::endl;
        return nullptr;
    }
}



} // namespace sql
