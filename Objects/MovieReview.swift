
import Foundation
class MovieReview : Codable {
    var id: Int?
    var results: [Review] = []
    
    init(id: Int, results: [Review]) {
        self.id = id
        self.results = results
    }
}

