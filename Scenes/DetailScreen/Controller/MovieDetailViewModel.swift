import Foundation
import UIKit
final class MovieDetailViewModel {
    var id: Int?
    var movieDetail: MovieDetail?
    var movieReview: MovieReview?
    var receivedNewData: (() -> ())?
    
    init(movieId: Int) {
        self.id = movieId
    }
    
    func fetchMovieDetails() {
        guard let id = id else { return }
        NetworkManager.shared.getMovieDetailData(id: id) { movieDetail in
            self.movieDetail = movieDetail
            self.receivedNewData?()
        }
    }
    
    func fetchReviewOfMovie() {
        guard let id = id else { return }
        NetworkManager.shared.getReviewMovieDetailData(id: id) { movieReview in
            self.movieReview = movieReview
            self.receivedNewData?()
        }
    }
    
    func getNumberOfRows(_ section: Int) -> Int {
        return movieReview?.results.count ?? 0
    }

    func getReviewMovieOfCell (_ indexPath: IndexPath) -> Review {
        return (movieReview?.results[indexPath.row])!
    }
}
