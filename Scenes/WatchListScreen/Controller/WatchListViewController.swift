import UIKit
import Foundation
import CoreData
class WatchListViewController: UIViewController {
    
    @IBOutlet weak var watchListMovieTableView: UITableView!
    var viewModel: WatchListViewModel!
    var coordinator: WatchListCoordinator!
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        showWatchList()
    }
    @IBAction func didTapLoadMore(_ sender: UIButton) {
    }
    
    @IBAction func didTapPopScreen(_ sender: UIButton) {
        coordinator.finish()
    }
    func configViewModel() {
        viewModel.receivedNewData = { [weak self] in
            DispatchQueue.main.async {
                self?.watchListMovieTableView.reloadData()
            }
        }
    }
    
    func delete() {
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
                    return
                }
        //1
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
                    return
                }
        
        let managedContext =
        appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "FavoriteMovie")
        
        //3
        do {
            let movies = try managedContext.fetch(fetchRequest)
            managedContext.delete(movies[1] as NSManagedObject)
            do {
                try managedContext.save()
            } catch {
                
            }
        } catch let error as NSError {
            print("Delete error. \(error), \(error.userInfo)")
        }
    }
    
    func showWatchList() {
        //1
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
                    return
                }
        
        let managedContext =
        appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "FavoriteMovie")
        
        //3
        do {
            let movies = try managedContext.fetch(fetchRequest)
            for movie in movies {
                let movieFavorite = MovieFavorite()
                movieFavorite.id = movie.value(forKey: "id") as! Int
                movieFavorite.posterImage = movie.value(forKey: "avatar") as! String
                movieFavorite.title = movie.value(forKey: "nameMovie") as! String
                movieFavorite.rateCount = movie.value(forKey: "rating") as! Float
                movieFavorite.releaseDate = movie.value(forKey: "releaseDate") as! String
                viewModel.movieFavorites.append(movieFavorite)
                watchListMovieTableView.reloadData()
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    private func configTableView() {
        watchListMovieTableView.dataSource = self
        watchListMovieTableView.delegate = self
        watchListMovieTableView.registerNib(cellName: WatchListTableViewCell.className)
    }
}
// MARK : TableView DataSource
extension WatchListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = watchListMovieTableView.dequeueReusableCell(withClass: WatchListTableViewCell.self, for: indexPath)
        if viewModel.movieFavorites.indices ~= indexPath.row {
            let movieFavorite = viewModel.getReviewMovieOfCell(indexPath)
            cell.fillData(movieFavorite: movieFavorite)
        }
        return cell
    }
}
// MARK : TableView Delegate
extension WatchListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Defines.movieTableRowHeight
    }
}

