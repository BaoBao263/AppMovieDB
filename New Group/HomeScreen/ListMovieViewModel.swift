import Foundation
final class ListMovieViewModel {
    var movies: [Movie] = []
    private var pageNumber = 1
    private var isLoading = false
    var sortType: SortType = .popularity
    var notify: (() -> ())?
    
    func fetchData() {
        pageNumber = 1
        NetworkManager.shared.getMovieData(page: pageNumber, sortType: sortType) { discoverMovie in
            self.movies = discoverMovie.results
            self.notify?()
        }
    }

    func getNumberOfRows(_ section: Int) -> Int {
        return movies.count
    }

    func getMovieOfCell (_ indexPath: IndexPath) -> Movie {
        return movies[indexPath.row]
    }
}
