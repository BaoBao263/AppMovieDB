import UIKit

class ListMovieViewController: UIViewController{
    
    @IBOutlet private weak var categoryListCollectionView: UICollectionView!
    @IBOutlet private weak var listMovieTableView: UITableView!
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var searchButton: UIButton!
    @IBOutlet private weak var loadMoreButton: UIButton!
    
    var coordinator: ListMovieCoordinator!
    var viewModel: ListMovieViewModel!
    var arraySort = SortType.allCases
    var searchMovie: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        fetchFirstPageMovies()
        updateUI()
        
    }
    
    @IBAction func didTapGoToWatchScreenButton(_ sender: UIButton) {
        coordinator.goToWatchListScreen()
    }
    
    @IBAction func didTapLoadMoreMovieButton(_ sender: UIButton) {
        loadMoreMovie()
    }
    @IBAction func didTapSearchButton(_ sender: UIButton) {
        if searchTextField.text == "" {
            fetchFirstPageMovies()
        } else {
            for i in 0..<viewModel.movies.count {
                guard let nameMovie = viewModel.movies[i].title else {return}
                if nameMovie.contains(searchTextField.text!){
                    searchMovie.append(viewModel.movies[i])
                }
            }
            viewModel.movies = searchMovie
            listMovieTableView.reloadData()
            fetchMovies()
        }
    }
}

//MARK: Fetch data
extension ListMovieViewController {
    func fetchMovies() {
        searchMovie = []
        let pageNumber = 1
        NetworkManager.shared.getMovieData(page: pageNumber, sortType: .popularity) { [self] discoverMovie in
            viewModel.movies = discoverMovie.results
        }
    }
    private func fetchFirstPageMovies() {
        viewModel.fetchData()
    }
    
    private func loadMoreMovie() {
        viewModel.loadMoreData()
    }
}
//MARK: Configure view
extension ListMovieViewController {
    private func configView() {
        configCollectionView()
        configTableView()
        configViewModel()
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
        viewModel.receivedNewData = { [weak self] in
            DispatchQueue.main.async {
                self?.listMovieTableView.reloadData()
            }
        }
    }
    private func updateUI() {
        searchTextField.layer.cornerRadius = Defines.cornerRadius
        searchTextField.clipsToBounds = true
        
    }
    
    func gotoDetailScreen(_ movie: Movie) {
        coordinator.goToMovieDetailScreen(movieId: movie.id)
    }
    func goToWatchListScreen(_ movie: Movie) {
        coordinator.goToWatchListScreen()
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
        return Defines.movieTableRowHeight
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.getMovieOfCell(indexPath)
        gotoDetailScreen(movie)
        tableView.deselectRow(at: indexPath, animated: true)
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
        return CGSize(width: (arraySort[indexPath.row].title.count) * 16, height: 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.sortType = arraySort[indexPath.row]
        fetchFirstPageMovies()
    }
}
