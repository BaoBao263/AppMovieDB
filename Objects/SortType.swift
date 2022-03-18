import Foundation

enum SortType: CaseIterable {
    case nowPlaying
    case popularity
    case topRated
    case upcoming
    case releaseDate
    case alphabet
    case overview
    case title
    
    var title: String {
        switch self {
        case .nowPlaying:
            return "Now Playing"
        case .upcoming:
            return "Upcoming"
        case .popularity:
            return "Popularity"
        case .topRated:
            return "Top Rated"
        case .title:
            return "Comedy"
        case .overview:
            return "Overview"
        case .releaseDate:
            return "Adventure"
        case .alphabet:
            return "Romantic"
        }
    }
    
    var apiParam: String {
        switch self {
        case .topRated:
            return "top_rated.desc"
        case .upcoming:
            return "top_rated.desc"
        case .nowPlaying:
            return "upcoming.desc"
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
