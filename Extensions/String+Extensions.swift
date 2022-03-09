import Foundation

extension String {
    
    var mergeUrl: String {
        return URLs.imageBaseURL + self
    }
}
