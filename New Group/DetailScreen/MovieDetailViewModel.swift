import Foundation
import UIKit
final class MovieDetailViewModel {
    var id: Int?
    var movieDetail: MovieDetail?
    var notify: (() -> ())?
    
    init(movieId: Int) {
        self.id = movieId
    }
    
    func fetchMovieDetails() {
        guard let id = id else { return }
        NetworkManager.shared.getMovieDetailData(id: id) { movieDetail in
            self.movieDetail = movieDetail
            self.notify?()
            print(movieDetail.posterImage)
        }
    }
    
}
