import UIKit

fileprivate struct DefinesHeight {
    static let movieTableRowHeight: CGFloat = 138
}
class ListMovieViewController: UIViewController {
    
    
    @IBOutlet weak var categoryListCollectionView: UICollectionView!
    @IBOutlet weak var listMovieTableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var loadMoreButton: UIButton!
    
    var coordinator: ListMovieCoordinator!
    var viewModel: ListMovieViewModel!
    var arraySort = SortType.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        fetchMoviesData()
    }
}

//MARK: Fetch data
extension ListMovieViewController {
    private func fetchMoviesData() {
        viewModel.fetchData()
    }
}
//MARK: Configure view
extension ListMovieViewController {
    private func configView() {
        configCollectionView()
        configTableView()
        configViewModel()
        configTextField()
    }
    private func configTextField() {
        searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Search Here...",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
    }
    private func configTableView() {
        listMovieTableView.dataSource = self
        listMovieTableView.delegate = self
        listMovieTableView.registerNib(cellName: ListMovieTableViewCell.className)
    }
    
    private func configCollectionView() {
        categoryListCollectionView.delegate = self
        categoryListCollectionView.dataSource = self
        categoryListCollectionView.registerNib(cellName: CategoriesCollectionViewCell.className)
    }
    
    func configViewModel() {
        viewModel.notify = {
            DispatchQueue.main.async { [weak self] in
                self?.listMovieTableView.reloadData()
            }
        }
    }
    
    func gotoDetailScreen(_ movie: Movie) {
        coordinator.goToMovieDetailScreen(movieId: movie.id)
    }
}
// MARK : TableView DataSource
extension ListMovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows(section)
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = listMovieTableView.dequeueReusableCell(withClass: ListMovieTableViewCell.self, for: indexPath)
        if viewModel.movies.indices ~= indexPath.row {
            let movie = viewModel.getMovieOfCell(indexPath)
            cell.fillData(with: movie)
        }
        return cell
    }
}
//MARK: TableView Delegate
extension ListMovieViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return DefinesHeight.movieTableRowHeight
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let movie = viewModel.getMovieOfCell(indexPath)
//        gotoDetailScreen(movie)
//        tableView.deselectRow(at: indexPath, animated: true)
        print(123)
    }

}

//MARK: SortView Collection
extension ListMovieViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arraySort.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categoryListCollectionView.dequeueReusableCell(withClass: CategoriesCollectionViewCell.self, for: indexPath)
        cell.categoriesLabel.text = arraySort[indexPath.row].title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width + 30, height: 24)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.sortType = arraySort[indexPath.row]
        fetchMoviesData()
    }
}
