#include "JsonFileGenerator.h"
#include <iostream>
#include <fstream>
#include <vector>
#include <sstream>
#include <string>

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

bool JsonFileGenerator::readJsonFile(const std::string& filename, std::vector<Data>& dataList) {
    std::ifstream inputFile(filename);
    if (!inputFile.is_open()) {
        std::cerr << "Error: Failed to open JSON file for reading\n";
        return false;
    }

    // Read the entire file contents into a string
    std::ostringstream oss;
    oss << inputFile.rdbuf();
    std::string jsonString = oss.str();

    // Simple JSON parsing
    size_t pos = jsonString.find("\"name\":");
    while (pos != std::string::npos) {
        Data data;
        size_t endPos = jsonString.find("}", pos);
        std::string entry = jsonString.substr(pos, endPos - pos);
        size_t namePos = entry.find("\"", 7);
        size_t nameEndPos = entry.find("\"", namePos + 1);
        data.name = entry.substr(namePos + 1, nameEndPos - namePos - 1);
        size_t songPos = entry.find("\"song\":");
        size_t songEndPos = entry.find("\"", songPos + 8);
        data.song = entry.substr(songPos + 8, songEndPos - songPos - 8);
        size_t countPos = entry.find("\"count\":");
        size_t countEndPos = entry.find(",", countPos + 8);
        data.count = std::stoi(entry.substr(countPos + 8, countEndPos - countPos - 8));
        dataList.push_back(data);
        pos = jsonString.find("\"name\":", endPos);
    }

    return true;
}
