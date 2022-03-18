import Foundation
class Movie: Codable {
    var id: Int
    var posterImage: String?
    var voteAverage: Float
    var title: String?
    var releaseDate: String
    
    init(posterImage: String, id: Int, voteAverage: Float, title: String?,releaseDate: String) {
        self.posterImage = posterImage
        self.id = id
        self.voteAverage = voteAverage
        self.title = title
        self.releaseDate = releaseDate
    }
    
    private enum CodingKeys : String, CodingKey {
        case id, title
        case posterImage = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}
