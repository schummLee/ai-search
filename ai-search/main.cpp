#include "include/MusicDatabase.h"
#include "include/APIServer.h"
#include <iostream>
#include <string>

int main() {
    // Create an instance of MusicDatabase
    MusicDatabase musicDB;

    // Connect to MySQL database and load music data
    std::string host = "tcp://localhost:3306";   // Hostname or IP address of the MySQL server
    std::string user = "root";        // Default MySQL username
    std::string password = "";        // Default MySQL password
    std::string database = "music_db";
    if (musicDB.loadFromMySQL(host, user, password, database).empty()) {
        std::cerr << "Failed to load music data from MySQL database.example dataset applied" << std::endl;
        MusicTrack newTrack;
        newTrack.genre = "example";
        newTrack.artist = "me";
        newTrack.title = "perfect";
    }


    // Create an instance of APIServer
    APIServer apiServer("http://localhost:8080");

    // Start the API server
    apiServer.start();

    std::cout << "Press 'q' to quit." << std::endl;

    // Main loop
    std::string userInput;
    while (true) {
        // Prompt the user to input a title
        std::cout << "Enter a title to search (or press 'q' to quit): ";
        std::getline(std::cin, userInput);

        // Check if the user wants to quit
        if (userInput == "q") {
            break;
        }

        // Search for the title in MySQL database
        std::vector<MusicTrack> titleResults = musicDB.searchByTitle(userInput);

        // Pass the search results to the API
        // Example: Implement API endpoint to handle search results
        // Modify this part according to your API implementation
        // For demonstration purposes, we'll print the search results here
        std::cout << "Search results for title \"" << userInput << "\":" << std::endl;
        for (const auto& track : titleResults) {
            std::cout << "Title: " << track.title << ", Artist: " << track.artist << ", Genre: " << track.genre << std::endl;
        }
    }

    // Stop the API server
    apiServer.stop();

    return 0;
}
