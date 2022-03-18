import Foundation
import UIKit
import CoreData
final class WatchListViewModel {
    var movieFavorites: [MovieFavorite] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var receivedNewData: (() -> ())?
    
    func getNumberOfRows(_ section: Int) -> Int {
        return movieFavorites.count ?? 0
    }

    func getReviewMovieOfCell (_ indexPath: IndexPath) -> MovieFavorite {
        return movieFavorites[indexPath.row]
    }
    
}
