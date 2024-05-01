#ifndef API_SERVER_H
#define API_SERVER_H

#include <cpprest/http_listener.h>
#include <cpprest/json.h>
#include <string>

using namespace web;
using namespace web::http;
using namespace web::http::experimental::listener;

class APIServer {
public:
    APIServer(const std::string& url);
    ~APIServer();
    void start();
    void stop();
    void closeListener();
private:
    http_listener listener;
    void handle_get(http_request request);
};

#endif // API_SERVER_H
