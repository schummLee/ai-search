#include "APIServer.h"
#include <iostream>
#include <cpprest/http_listener.h>
#include <cpprest/json.h>
#include <boost/asio/ssl.hpp>
#include <cpprest/http_listener.h>

using namespace web;
using namespace http;
using namespace http::experimental::listener;

// Constructor
APIServer::APIServer(const std::string& uri) : m_listener(uri) {
    // Create the http_listener_config object
    web::http::experimental::listener::http_listener_config config;

    // Set the SSL context callback to configure TLS options
    config.set_ssl_context_callback([](boost::asio::ssl::context& ctx) {
        // Set SSL options to support TLSv1.2 and disable older versions
        ctx.set_options(boost::asio::ssl::context::default_workarounds |
                        boost::asio::ssl::context::no_sslv2 |
                        boost::asio::ssl::context::no_sslv3 |
                        boost::asio::ssl::context::tlsv12);
    });

    // Create the http_listener with the specified URI and TLS configuration
    m_listener = web::http::experimental::listener::http_listener(uri, config);

    // Support GET method and bind handle_get function
    m_listener.support(methods::GET, std::bind(&APIServer::handle_get, this, std::placeholders::_1));
}

// Destructor
APIServer::~APIServer() {
    // Destructor implementation, if needed
}

// Start the API server
void APIServer::start() {
    m_listener.open().then([this](){ std::cout << "API server started successfully." << std::endl; }).wait();
}

// Stop the API server
void APIServer::stop() {
    m_listener.close().then([this](){ std::cout << "API server stopped." << std::endl; }).wait();
}

// Handle GET requests
void APIServer::handle_get(http_request request) {
    // Extract the request path
    auto path = request.request_uri().path();

    // Check the request path
    if (path == "/music") {
        // Get the music data from the MusicDatabase
        std::string host = "localhost";   // Hostname or IP address of the MySQL server
        std::string user = "lee";        // MySQL username
        std::string password = "password";        // MySQL password
        std::string database = "music_db"; // MySQL database name
        std::vector<MusicTrack> musicData = m_musicDB.loadFromMySQL(host, user, password, database);

        // Convert music data to JSON
        json::value jsonResponse;
        json::value& tracksArray = jsonResponse[U("tracks")];
        for (const auto& track : musicData) {
            json::value trackJson;
            trackJson[U("title")] = json::value::string(track.title);
            trackJson[U("artist")] = json::value::string(track.artist);
            trackJson[U("genre")] = json::value::string(track.genre);
            tracksArray[tracksArray.size()] = trackJson;
        }

        // Set the response content type
        request.reply(status_codes::OK, jsonResponse);
    } else {
        // Handle invalid paths
        request.reply(status_codes::NotFound);
    }
}
