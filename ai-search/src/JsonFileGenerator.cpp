#include "JsonFileGenerator.h"
#include <iostream>
#include <fstream>
#include <vector>
#include <sstream>
#include <string>
#include "json.hpp"
using json = nlohmann::json;

struct MusicData {
    int songsPlayed;
    struct MostPlayed {
        long long lastPlayed;
        int playCount;
        bool isYoutube;
        std::string title;
        std::string artist;
        std::string album;
        std::string id;
    } mostPlayed;
    std::string name;
};

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

bool readJsonFile(const std::string& filename, MusicData& data) {
    try {
        std::ifstream file(filename);
        if (!file.is_open()) {
            std::cerr << "Failed to open file: " << filename << std::endl;
            return false;
        }

        json jsonData;
        file >> jsonData;

        // Extract data from JSON
        data.songsPlayed = jsonData["songsPlayed"];
        data.name = jsonData["name"];
        data.mostPlayed.lastPlayed = jsonData["mostPlayed"]["lastPlayed"];
        data.mostPlayed.playCount = jsonData["mostPlayed"]["playCount"];
        data.mostPlayed.isYoutube = jsonData["mostPlayed"]["isYoutube"];
        data.mostPlayed.title = jsonData["mostPlayed"]["title"];
        data.mostPlayed.artist = jsonData["mostPlayed"]["artist"];
        data.mostPlayed.album = jsonData["mostPlayed"]["album"];
        data.mostPlayed.id = jsonData["mostPlayed"]["id"];

        return true;
    } catch (const std::exception& e) {
        std::cerr << "Error while reading JSON file: " << e.what() << std::endl;
        return false;
    }
}
