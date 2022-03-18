
import Foundation

class Review: Codable {
    var reviewerName: String?
    var content: String?
    var avatar: String?
    var reviewerInfo: ReviewerInfo

    init(reviewerName: String, content: String, reviewerInfo: ReviewerInfo, avatar: String) {
        self.reviewerName = reviewerName
        self.content = content
        self.avatar = avatar
        self.reviewerInfo = reviewerInfo
    }
    
    private enum CodingKeys: String, CodingKey {
        case reviewerName = "author"
        case avatar = "avatar_path"
        case reviewerInfo = "author_details"
        case content
    }
}

