#ifndef MUSICDATABASE_H
#define MUSICDATABASE_H

#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>

// Define a structure to represent a music track
struct MusicTrack {
    std::string title;
    std::string artist;
    std::string genre;
};
struct UserData {
    std::string name;
    std::string song;
    int count;
};

class MusicDatabase {
public:
    MusicDatabase(); // Constructor
    ~MusicDatabase(); // Destructor

    bool loadFromCSV(const std::string& filename); // Load music data from a CSV file
    std::vector<MusicTrack> loadFromMySQL(const std::string& host, const std::string& user, const std::string& password, const std::string& database); // Load music data from MySQL
    std::vector<UserData> PassToMySQL(const std::string& host, const std::string& user, const std::string& password, const std::string& database, const std::vector<UserData>& datas);

    std::vector<MusicTrack> searchByCondition(const std::string& condition) const; // Search by condition
    std::vector<MusicTrack> searchByPersonalReferences(const std::string& reference) const; // Search by personal references

    // Data search functions
    std::vector<MusicTrack> searchByTitle(const std::string& keyword) const;
    std::vector<MusicTrack> searchByArtist(const std::string& keyword) const;
    std::vector<MusicTrack> searchByGenre(const std::string& keyword) const;

private:
    std::vector<MusicTrack> tracks; // Vector to store music tracks

    MusicTrack parseCSVLine(const std::string& line) const; // Parse CSV line and create MusicTrack object
};

#endif // MUSICDATABASE_H
