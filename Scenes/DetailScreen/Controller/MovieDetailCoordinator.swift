import Foundation
import UIKit
class MovieDetailCoordinator: Coordinator {
    init(navigationController: UINavigationController?, movieId: Int?){
        self.navigationController = navigationController
        self.movieId = movieId
    }
    
    var navigationController: UINavigationController?
    var movieId: Int?
    
    func start() {
        guard let movieDetailVC = UIStoryboard.init(name: "MovieDetailViewController", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController
        else {return}
        let viewModel = MovieDetailViewModel(movieId: movieId ?? 0)
        movieDetailVC.coordinator = self
        movieDetailVC.viewModel = viewModel
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
    
    func finish() {
    }
}

