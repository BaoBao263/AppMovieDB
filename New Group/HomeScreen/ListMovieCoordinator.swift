import Foundation
import UIKit
class ListMovieCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        guard let listMovieVC = UIStoryboard.init(name: "ListMovieViewController", bundle: nil).instantiateViewController(withIdentifier: "ListMovieViewController") as? ListMovieViewController
        else {return}
        let viewModel = ListMovieViewModel()
        listMovieVC.coordinator = self
        listMovieVC.viewModel = viewModel
        navigationController?.viewControllers = [listMovieVC]
        navigationController?.navigationBar.isHidden = true
    }
    
    func finish() {
    }
    func goToMovieDetailScreen(movieId: Int) {
//        let movieDetailCoordinator = MovieDetailCoordinator(navigationController: navigationController, movieId: movieId)
//        movieDetailCoordinator.start()
    }
}
