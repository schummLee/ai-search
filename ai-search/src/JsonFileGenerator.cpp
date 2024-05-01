#include "JsonFileGenerator.h"
#include <fstream>

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
