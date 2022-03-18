
import Foundation
class MovieDetail: Codable {
    var id: Int
    var backgroundImage: String
    var posterImage: String
    var title: String
    var overview: String
    var releaseDate: String
    var voteAverage: Float
    var rateCount: Float
    var popularity: Float
    var genres: [Genre]

    init(voteAverage: Float, backgroundImage: String, posterImage: String, overview: String, title: String, releaseDate: String, rateCount: Float, popularity: Float, genres: [Genre], id: Int) {
        self.voteAverage = voteAverage
        self.backgroundImage = backgroundImage
        self.posterImage = posterImage
        self.overview = overview
        self.title = title
        self.releaseDate = releaseDate
        self.rateCount = rateCount
        self.popularity = popularity
        self.genres = genres
        self.id = id
    }
    private enum CodingKeys : String, CodingKey {
        case overview,popularity, genres, id
        case voteAverage = "vote_average"
        case backgroundImage = "backdrop_path"
        case posterImage = "poster_path"
        case title = "original_title"
        case releaseDate = "release_date"
        case rateCount = "vote_count"
    }
}

