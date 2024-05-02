#include "../include/MusicDatabase.h"
#include "../include/MySQLConnector.h" // MySQLConnector class

// Constructor
MusicDatabase::MusicDatabase() {}

// Destructor
MusicDatabase::~MusicDatabase() {}

// Function to load music data from a CSV file
bool MusicDatabase::loadFromCSV(const std::string& filename) {
    std::ifstream file(filename);
    if (!file.is_open()) {
        return false; // Failed to open file
    }

    std::string line;
    while (std::getline(file, line)) {
        MusicTrack track = parseCSVLine(line);
        tracks.push_back(track);
    }

    file.close();
    return true;
}

// Function to load music data from MySQL
std::vector<MusicTrack> MusicDatabase::loadFromMySQL(const std::string& host, const std::string& user, const std::string& password, const std::string& database) {
    std::vector<MusicTrack> tracks;
    try {
        sql::mysql::MySQL_Driver *driver;
        sql::Connection *con;
        sql::PreparedStatement *pstmt;
        sql::ResultSet *res;

        driver = sql::mysql::get_mysql_driver_instance();
        if (!driver) {
            std::cerr << "Failed to get MySQL driver instance" << std::endl;
            return tracks; // Return empty vector
        }

        con = driver->connect(host, user, password);
        if (!con) {
            std::cerr << "Failed to connect to MySQL server" << std::endl;
            return tracks; // Return empty vector
        }

        con->setSchema(database);

        pstmt = con->prepareStatement("SELECT * FROM music_info LIMIT 10");
        res = pstmt->executeQuery();

        while (res->next()) {
            MusicTrack track;
            track.title = res->getString("title");
            track.artist = res->getString("artist");
            track.genre = res->getString("genre");
            tracks.push_back(track);
        }

        delete res;
        delete pstmt;
        delete con;

    } catch (const sql::SQLException& e) {
        std::cerr << "MySQL Error: " << e.what() << std::endl;
    }
    return tracks;
}

std::vector<UserData> MusicDatabase::PassToMySQL(const std::string& host, const std::string& user, const std::string& password, const std::string& database, const UserData& datas) {
    std::vector<UserData> insertedDatas;

    try {
        sql::mysql::MySQL_Driver *driver;
        sql::Connection *con;
        sql::PreparedStatement *pstmt;

        driver = sql::mysql::get_mysql_driver_instance();
        if (!driver) {
            std::cerr << "Failed to get MySQL driver instance" << std::endl;
            return insertedDatas; // Return empty vector
        }

        con = driver->connect(host, user, password);
        if (!con) {
            std::cerr << "Failed to connect to MySQL server" << std::endl;
            return insertedDatas; // Return empty vector
        }

        con->setSchema(database);

        // Prepare the insert statement
        pstmt = con->prepareStatement("INSERT INTO u_user (name, song, count) VALUES (?, ?, ?)");

        // Insert each track into the database
        for (const auto& data : datas) {
            pstmt->setString(1, data.name);
            pstmt->setString(2, data.song);
            
            pstmt->setInt(3, data.count); 
            pstmt->execute();
            insertedDatas.push_back(data);
        }

        delete pstmt;
        delete con;

    } catch (const sql::SQLException& e) {
        std::cerr << "MySQL Error: " << e.what() << std::endl;
    }

    return insertedDatas;
}

// Implementation of the condition search function
std::vector<MusicTrack> MusicDatabase::searchByCondition(const std::string& condition) const {
    // Sample implementation: search by genre
    std::vector<MusicTrack> results;
    for (const auto& track : tracks) {
        // Assuming the condition represents the genre
        // Modify this logic as needed for other conditions
        if (track.genre.find(condition) != std::string::npos) {
            results.push_back(track);
        }
    }
    return results;
}

// Implementation of the personal references search function
std::vector<MusicTrack> MusicDatabase::searchByPersonalReferences(const std::string& reference) const {
    // Sample implementation: search by user preferences
    std::vector<MusicTrack> results;
    // Assuming the reference represents user preferences
    // Modify this logic as needed for other personal references
    for (const auto& track : tracks) {
        // Example: search for tracks with specified artist in user preferences
        if (reference.find(track.artist) != std::string::npos) {
            results.push_back(track);
        }
    }
    return results;
}

// Function to parse CSV lines and create MusicTrack objects
MusicTrack MusicDatabase::parseCSVLine(const std::string& line) const {
    std::istringstream iss(line);
    std::string title, artist, genre;
    std::getline(iss, title, ',');
    std::getline(iss, artist, ',');
    std::getline(iss, genre, ',');
    return {title, artist, genre};
}

// Data search functions
std::vector<MusicTrack> MusicDatabase::searchByTitle(const std::string& keyword) const {
    std::vector<MusicTrack> results;
    // try {
    //     sql::PreparedStatement* pstmt = con->prepareStatement("SELECT * FROM music_tracks WHERE title LIKE ?");
    //     pstmt->setString(1, "%" + keyword + "%");
    //     sql::ResultSet* res = pstmt->executeQuery();
    //     while (res->next()) {
    //         MusicTrack track;
    //         track.title = res->getString("title");
    //         track.artist = res->getString("artist");
    //         track.genre = res->getString("genre");
    //         results.push_back(track);
    //     }
    //     delete res;
    //     delete pstmt;
    // } catch (const sql::SQLException& e) {
    //     std::cerr << "SQL Error: " << e.what() << std::endl;
    // }
    return results;
}

std::vector<MusicTrack> MusicDatabase::searchByArtist(const std::string& keyword) const {
    std::vector<MusicTrack> results;
    for (const auto& track : tracks) {
        if (track.artist.find(keyword) != std::string::npos) {
            results.push_back(track);
        }
    }
    return results;
}

std::vector<MusicTrack> MusicDatabase::searchByGenre(const std::string& keyword) const {
    std::vector<MusicTrack> results;
    for (const auto& track : tracks) {
        if (track.genre.find(keyword) != std::string::npos) {
            results.push_back(track);
        }
    }
    return results;
}
