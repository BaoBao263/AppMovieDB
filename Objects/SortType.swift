import Foundation

enum SortType: CaseIterable {
    case title
    case popularity
    case releaseDate
    case alphabet
    case overview
    
    var title: String {
        switch self {
        case .title:
            return "Comedy"
        case .overview:
            return "Overview"
        case .releaseDate:
            return "Adventure"
        case .alphabet:
            return "Romantic"
        case .popularity:
            return "Popularity"
        }
    }
    
    var apiParam: String {
        switch self {
        case .title:
            return "title.desc"
        case .overview:
            return "overview.desc"
        case .releaseDate:
            return "release_date.desc"
        case .alphabet:
            return "original_title.asc"
        case .popularity:
            return "popularity.desc"
        }
    }
}
