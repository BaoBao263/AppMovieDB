
import Foundation
class MovieDetail: Codable {
    var backgroundImage: String
    var posterImage: String
    var title: String
    var overview: String
    var releaseDate: String
    var voteAverage: Float
    var rateCount: Float
    var popularity: Float

    init(voteAverage: Float, backgroundImage: String, posterImage: String, overview: String, title: String, releaseDate: String, rateCount: Float, popularity: Float) {
        self.voteAverage = voteAverage
        self.backgroundImage = backgroundImage
        self.posterImage = posterImage
        self.overview = overview
        self.title = title
        self.releaseDate = releaseDate
        self.rateCount = rateCount
        self.popularity = popularity
        
    }
    private enum CodingKeys : String, CodingKey {
        case overview,popularity
        case voteAverage = "vote_average"
        case backgroundImage = "backdrop_path"
        case posterImage = "poster_path"
        case title = "original_title"
        case releaseDate = "release_date"
        case rateCount = "vote_count"
    }
}

