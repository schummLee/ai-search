#include "../include/APIServer.h"

APIServer::APIServer(const std::string& url) : listener(url) {
    listener.support(methods::GET, std::bind(&APIServer::handle_get, this, std::placeholders::_1));
}

APIServer::~APIServer() {}

void APIServer::start() {
    try {
        listener
            .open()
            .then([]() { std::cout << "API server started successfully." << std::endl; })
            .wait();
    } catch (const std::exception& e) {
        std::cerr << "Error starting API server: " << e.what() << std::endl;
    }
}

void APIServer::closeListener() {
    listener
        .close()
        .then([]() { std::cout << "Listener closed successfully." << std::endl; })
        .wait();
}


void APIServer::stop() {
    try {
        closeListener(); // Close the listener to stop the server
        std::cout << "API server stopped." << std::endl;
    } catch (const std::exception& e) {
        std::cerr << "Error stopping API server: " << e.what() << std::endl;
    }
}

void APIServer::handle_get(http_request request) {
    ucout << "Received GET request" << std::endl;
    json::value response;
    response[U("message")] = json::value::string(U("Hello, world!"));
    request.reply(status_codes::OK, response);
}
