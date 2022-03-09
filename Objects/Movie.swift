import Foundation
class Movie: Codable {
    var id: Int
    var posterImage: String?
    var popularity: Float
    var title: String?
    var releaseDate: String
    
    init(posterImage: String, id: Int, popularity: Float, title: String?,releaseDate: String) {
        self.posterImage = posterImage
        self.id = id
        self.popularity = popularity
        self.title = title
        self.releaseDate = releaseDate
    }
    
    private enum CodingKeys : String, CodingKey {
        case id, popularity, title
        case posterImage = "poster_path"
        case releaseDate = "release_date"
    }
}
