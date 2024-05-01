#ifndef JSON_FILE_GENERATOR_H
#define JSON_FILE_GENERATOR_H

#include <string>

class JsonFileGenerator {
public:
    // Constructor
    JsonFileGenerator();

    // Destructor
    ~JsonFileGenerator();

    // Method to generate a JSON file from the given JSON string
    bool generateJsonFile(const std::string& jsonStr, const std::string& filename);
};

#endif // JSON_FILE_GENERATOR_H
