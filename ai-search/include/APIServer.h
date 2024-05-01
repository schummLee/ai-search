#ifndef API_SERVER_H
#define API_SERVER_H

#include <cpprest/http_listener.h>
#include <cpprest/json.h>
#include <string>
#include "MusicDatabase.h" // Include the MusicDatabase header file

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
    http_listener m_listener; // Declare m_listener as a member
    MusicDatabase m_musicDB; // Declare m_musicDB as a member
    void handle_get(http_request request);
};

#endif // API_SERVER_H
