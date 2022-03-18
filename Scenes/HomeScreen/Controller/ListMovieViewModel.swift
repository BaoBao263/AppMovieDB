import Foundation
final class ListMovieViewModel {
    var movies: [Movie] = []
    private var pageNumber = 1
    private var isLoading = false
    var sortType: SortType = .nowPlaying
    var receivedNewData: (() -> ())?
    
    func fetchData() {
        pageNumber = 1
        NetworkManager.shared.getMovieData(page: pageNumber, sortType: sortType) { discoverMovie in
            self.movies = discoverMovie.results
            self.receivedNewData?()
        }
    }
    func loadMoreData() {
        pageNumber += 1
        NetworkManager.shared.getMovieData(page: pageNumber, sortType: sortType) { [self] discoverMovie in
            self.movies += discoverMovie.results
            self.receivedNewData?()
            if pageNumber == discoverMovie.totalPages {
                pageNumber = pageNumber - 1
            }
        }
    }
    
    func getNumberOfRows(_ section: Int) -> Int {
        return movies.count
    }
    
    func getMovieOfCell (_ indexPath: IndexPath) -> Movie {
        return movies[indexPath.row]
    }
}
