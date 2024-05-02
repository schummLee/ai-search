#include "../include/JsonFileGenerator.h"
#include <iostream>
#include <fstream>
#include <vector>
#include <sstream>
#include <string>
#include "../include/json.hpp"
using json = nlohmann::json;



JsonFileGenerator::JsonFileGenerator() {}

JsonFileGenerator::~JsonFileGenerator() {}

bool JsonFileGenerator::generateJsonFile(const std::string& jsonStr, const std::string& filename) {
    // Write the JSON string to the specified file
    std::ofstream outputFile(filename);
    if (outputFile.is_open()) {
        outputFile << jsonStr;
        outputFile.close();
        return true; // File generation successful
    } else {
        return false; // Failed to open file for writing
    }
}

bool JsonFileGenerator::readJsonFile(const std::string& filename, std::vector<MusicData>& dataList) {
    try {
        std::ifstream file(filename);
        if (!file.is_open()) {
            std::cerr << "Failed to open file: " << filename << std::endl;
            return false;
        }

        json jsonData;
        file >> jsonData;

        // Create a MusicData object and populate it with JSON data
        MusicData data;
        data.songsPlayed = jsonData["songsPlayed"];
        data.name = jsonData["name"];
        data.mostPlayed.lastPlayed = jsonData["mostPlayed"]["lastPlayed"];
        data.mostPlayed.playCount = jsonData["mostPlayed"]["playCount"];
        data.mostPlayed.isYoutube = jsonData["mostPlayed"]["isYoutube"];
        data.mostPlayed.title = jsonData["mostPlayed"]["title"];
        data.mostPlayed.artist = jsonData["mostPlayed"]["artist"];
        data.mostPlayed.album = jsonData["mostPlayed"]["album"];
        data.mostPlayed.id = jsonData["mostPlayed"]["id"];

        dataList.push_back(data); // Push back the MusicData object into the vector

        return true;
    } catch (const std::exception& e) {
        std::cerr << "Error while reading JSON file: " << e.what() << std::endl;
        return false;
    }
}


// Function to read the largest number from JSON file names
std::string JsonFileGenerator::readLargestNumberFromFile() {
    try {
        int largestNumber = std::numeric_limits<int>::min();
        for (const auto& entry : std::filesystem::directory_iterator("../upload/static")) {
            if (entry.is_regular_file()) {
                std::string filename = entry.path().filename().stem().string(); // Extract filename without extension
                try {
                    int number = std::stoi(filename);
                    if (number > largestNumber) {
                        largestNumber = number;
                    }
                } catch (const std::invalid_argument& e) {
                    // Ignore files with invalid number format
                }
            }
        }

        if (largestNumber == std::numeric_limits<int>::min()) {
            std::cerr << "No valid JSON files found in the directory." << std::endl;
            return ""; // Return empty string if no valid files found
        }

        return std::to_string(largestNumber); // Convert largest number to string
    } catch (const std::exception& e) {
        std::cerr << "Error while reading directory: " << e.what() << std::endl;
        return ""; // Return empty string in case of error
    }
}