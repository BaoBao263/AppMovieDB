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
//    func start() {
//        guard let listMovieVC = UIStoryboard.init(name: "ListMovieViewController", bundle: nil).instantiateViewController(withIdentifier: "ListMovieViewController") as? ListMovieViewController
//        else {return}
//        let viewModel = ListMovieViewModel()
//        listMovieVC.coordinator = self
//        listMovieVC.viewModel = viewModel
//        navigationController?.viewControllers = [listMovieVC]
//        navigationController?.navigationBar.isHidden = true
//    }
    
    func finish() {
    }
}

