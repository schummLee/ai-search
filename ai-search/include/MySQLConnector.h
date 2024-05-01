#ifndef MYSQL_CONNECTOR_H
#define MYSQL_CONNECTOR_H

#include <mysql_connection.h>
#include <mysql_driver.h>
#include <cppconn/exception.h>
#include <cppconn/driver.h>
#include <cppconn/statement.h>
#include <cppconn/resultset.h>
#include <cppconn/prepared_statement.h>

#include <iostream>
#include <string>
#include <memory>

namespace sql {

class MySQLConnector {
public:
    MySQLConnector(const std::string& host, const std::string& user, const std::string& password, const std::string& database);
    ~MySQLConnector();
    bool connect();
    bool isConnected();
    sql::ResultSet* executeQuery(const std::string& query);

private:
    sql::mysql::MySQL_Driver* driver;
    std::unique_ptr<sql::Connection> con;
    std::string host_;
    std::string user_;
    std::string password_;
    std::string database_;
    bool connected_;
};

} // namespace sql

#endif // MYSQL_CONNECTOR_H
