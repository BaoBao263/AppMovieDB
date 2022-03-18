
import Foundation

final class DiscoverMovie: Codable {
    var page: Int?
    var results: [Movie] = []
    var totalPages: Int?
    
    init(page: Int, totalPages: Int, results: [Movie]) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
    }
    private enum CodingKeys : String, CodingKey {
        case page, results
        case totalPages = "total_pages"
    }
}

