#ifndef JSON_FILE_GENERATOR_H
#define JSON_FILE_GENERATOR_H

#include <string>
#include <vector>
#include <filesystem>

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

struct Data { std::string name; std::string song; int count;};

class JsonFileGenerator {
public:
    // Constructor
    JsonFileGenerator();

    // Destructor
    ~JsonFileGenerator();

    // Method to generate a JSON file from the given JSON string
    bool generateJsonFile(const std::string& jsonStr, const std::string& filename);

    bool readJsonFile(const std::string& filename, std::vector<MusicData>& dataList);

    std::string readLargestNumberFromFile();
};

#endif // JSON_FILE_GENERATOR_H
