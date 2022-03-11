import Foundation
import UIKit
final class MovieDetailViewModel {
    var id: Int?
    var movieDetail: MovieDetail?
    var movieReview: MovieReview?
    var notify: (() -> ())?
    
    init(movieId: Int) {
        self.id = movieId
    }
    
    func fetchMovieDetails() {
        guard let id = id else { return }
        NetworkManager.shared.getMovieDetailData(id: id) { movieDetail in
            self.movieDetail = movieDetail
            self.notify?()
        }
    }
    
    func fetchReviewOfMovie() {
        guard let id = id else { return }
        NetworkManager.shared.getReviewMovieDetailData(id: id) { movieReview in
            self.movieReview = movieReview
            self.notify?()
        }
    }
    
    func getNumberOfRows(_ section: Int) -> Int {
        return movieReview?.results.count ?? 0
    }

    func getReviewMovieOfCell (_ indexPath: IndexPath) -> Review {
        return (movieReview?.results[indexPath.row])!
    }
}
