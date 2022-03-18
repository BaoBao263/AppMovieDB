import Foundation
import UIKit
class WatchListCoordinator: Coordinator {
    init(navigationController: UINavigationController?){
        self.navigationController = navigationController
    }
    
    var navigationController: UINavigationController?
    
    func start() {
        guard let watchListVC = UIStoryboard.init(name: "WatchListViewController", bundle: nil).instantiateViewController(withIdentifier: "WatchListViewController") as? WatchListViewController
        else {return}
        let viewModel = WatchListViewModel()
        watchListVC.coordinator = self
        watchListVC.viewModel = viewModel
        navigationController?.pushViewController(watchListVC, animated: true)
    }
    
    func finish() {
        navigationController?.popViewController(animated: true)
    }
}

