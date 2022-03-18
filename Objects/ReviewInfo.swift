

import Foundation
class ReviewerInfo: Codable {
    let rating: Double?
    
    init(rating: Double?){
        self.rating = rating
    }
}
