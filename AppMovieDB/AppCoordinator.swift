import Foundation
import UIKit

class AppCoordinator {
    var window: UIWindow?
    init(window: UIWindow?) {
        self.window = window
        
    }
    func start() {
        let navigationController = UINavigationController()
        let listMovieCoordinator = ListMovieCoordinator(navigationController: navigationController)
        listMovieCoordinator.start()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func finish() {
        
    }
}
