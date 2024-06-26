// main.cpp
#include "include/MusicDatabase.h"
#include "include/APIServer.h"
#include "include/JsonFileGenerator.h"
#include <iostream>
#include <string>
#include <vector>
#include "include/json.hpp"
#include <cstdlib>


using nlohmann_json = nlohmann::json;

int main() {
    // Create an instance of MusicDatabase
    MusicDatabase musicDB;
    std::vector<MusicTrack> titleResults;
    JsonFileGenerator fileGenerator;

    // Connect to MySQL database and load music data
    std::string host = "localhost";   // Hostname or IP address of the MySQL server
    std::string user = "lee";        // Default MySQL username
    std::string password = "password";        // Default MySQL password
    std::string database = "music_db";
    if (musicDB.loadFromMySQL(host, user, password, database).empty()) {
        std::cerr << "Failed to load music data from MySQL database. Example dataset applied." << std::endl;
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

        // Read the largest number from JSON file names
    // std::string largestNumber = fileGenerator.readLargestNumberFromFile();
    // if (largestNumber.empty()) {
    //     std::cerr << "Failed to read largest number from JSON file names." << std::endl;
    //     return 1; // Return error code
    // }
    std::string largestNumber = "test";
    // Create a vector to hold UserData with the largest number as name
    std::vector<MusicData> musicDataList;
    UserData threeDatas;
    std::vector<UserData> insertedData;

    if (!fileGenerator.readJsonFile("../upload/static/" + largestNumber + ".json", musicDataList)) {
        std::cerr << "Failed to read JSON file." << std::endl;
        return 1; // Return error code
    }
    
    threeDatas.name = musicDataList[0].name;
    threeDatas.song = musicDataList[0].mostPlayed.title;
    threeDatas.count = musicDataList[0].mostPlayed.playCount;
       
    // Pass vector of UserData to PassToMySQL function
    insertedData = musicDB.PassToMySQL(host, user, password, database, threeDatas);
    
    // Check if insertion was successful
    if (insertedData.size() == 1) {
        std::cout << "UserData inserted successfully:" << std::endl;
        std::cout << "Name: " << insertedData[0].name << std::endl;
        // Print other fields if needed
    } else {
        std::cerr << "Failed to insert UserData into MySQL." << std::endl;
        return 1; // Return error code
    }

        // Search for the title in MySQL database
        titleResults = musicDB.loadFromMySQL(host,user,password,database);

        // Convert titleResults to JSON using nlohmann/json library
        nlohmann_json jsonTitleResults = nlohmann_json::array();

        // Iterate over the titleResults vector and add each MusicTrack object to the JSON array
        for (const auto& track : titleResults) {
            nlohmann_json trackJson;
            trackJson["title"] = track.title;
            trackJson["artist"] = track.artist;
            trackJson["genre"] = track.genre;
            jsonTitleResults.push_back(trackJson);
        }

        // Serialize JSON to string
        std::string jsonStr = jsonTitleResults.dump(2);
        // Find the position of the first '[' and last ']'
        size_t firstBracketPos = jsonStr.find('[');
        size_t lastBracketPos = jsonStr.find_last_of(']');

        // Replace '[' with '{' and ']' with '}' only if they exist
         // Replace the first '[' with '{' and the last ']' with '}', if they exist
        // if (!jsonStr.empty() && jsonStr[0] == '[' && jsonStr.back() == ']') {
        //     jsonStr[0] = '{';
        //     jsonStr[jsonStr.size() - 1] = '}';
        // }
        //std::string jsonStrWithoutBrackets = jsonStr.substr(1, jsonStr.size() - 2);
        // Execute Python script with JSON string as argument
        std::string command = "../api.py '" + jsonStr + "'";
        std::cout << jsonStr << std::endl;
        system(command.c_str());

        

        // Generate the JSON file
        std::string filename = "../../drop/assets/output.json";
        if (fileGenerator.generateJsonFile(jsonStr, filename)) {
            std::cout << "JSON file generated successfully." << std::endl;
        } else {
            std::cerr << "Failed to generate JSON file." << std::endl;
        }
        

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
