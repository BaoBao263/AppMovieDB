import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet private weak var backGroundImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet private weak var nameMovieLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var averageRatingLabel: UILabel!
    @IBOutlet private weak var rateCountLabel: UILabel!
    @IBOutlet private weak var popularityLabel: UILabel!
    @IBOutlet weak var reviewsTableView: UITableView!
    
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var aboutMovieView: UIView!
    @IBOutlet weak var reviewsView: UIView!
    @IBOutlet weak var subViewAboutMovie: UIView!
    @IBOutlet weak var subViewReviews: UIView!
    
    var viewModel: MovieDetailViewModel!
    var coordinator: MovieDetailCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovieDetail()
        config()
    }
    
    @IBAction func didTapBackGoToHomeScreenButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func didTapAboutMovieButton(_ sender: UIButton) {
        subViewAboutMovie.isHidden = false
        aboutMovieView.isHidden = false
        reviewsView.isHidden = true
        subViewReviews.isHidden = true
    }
    
    @IBAction func didTapReviewsButton(_ sender: Any) {
        subViewAboutMovie.isHidden = true
        aboutMovieView.isHidden = true
        reviewsView.isHidden = false
        subViewReviews.isHidden = false
    }
    
}


//MARK: Fetch data
extension MovieDetailViewController {
    
    func updateUI() {
        if let backdropImage = viewModel.movieDetail?.backgroundImage {
            backGroundImageView.getImageFromUrl(url: backdropImage)
        }
        if let posterImage = viewModel.movieDetail?.posterImage {
            avatarImageView.getImageFromUrl(url: posterImage)
        }
        nameMovieLabel.text = viewModel.movieDetail?.title
        overviewLabel.text = viewModel.movieDetail?.overview
        dateLabel.text = viewModel.movieDetail?.releaseDate
        if let averageRating = viewModel.movieDetail?.voteAverage {
        averageRatingLabel.text = "\(averageRating)"
        }
        if let rateCount = viewModel.movieDetail?.rateCount {
        rateCountLabel.text = "\(rateCount)"
        }
        if let popularity = viewModel.movieDetail?.popularity {
        popularityLabel.text = "\(popularity)"
        }
    }
    
    func fetchMovieDetail() {
        viewModel.fetchMovieDetails()
        viewModel.fetchReviewOfMovie()
    }
}
//MARK: Configure view
extension MovieDetailViewController {
    private func config() {
        configViewModel()
        configView()
        configTableView()
        configImageView()
        configCollectionView()
    }
    private func configCollectionView() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.registerNib(cellName: CategoryCollectionViewCell.className)
    }
    
    func configViewModel() {
        viewModel.notify = { [weak self] in
            DispatchQueue.main.async {
                self?.updateUI()
            }
        }
    }
    
    private func configImageView() {
        avatarImageView.layer.cornerRadius = Defines.cornerRadius
        backGroundImageView.layer.cornerRadius = Defines.cornerRadius
        
    }
    private func configView() {
        subViewAboutMovie.isHidden = true
        aboutMovieView.isHidden = true
        reviewsView.isHidden = true
        subViewReviews.isHidden = true
    }
    private func configTableView() {
        reviewsTableView.dataSource = self
        reviewsTableView.delegate = self
        reviewsTableView.registerNib(cellName: ReviewsTableViewCell.className)
    }
}
// MARK : TableView DataSource
extension MovieDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows(section)
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = reviewsTableView.dequeueReusableCell(withClass: ReviewsTableViewCell.self, for: indexPath)
        if (viewModel.movieReview?.results.indices)! ~= indexPath.row {
            let review = viewModel.getReviewMovieOfCell(indexPath)
            cell.fillData(with: review)
        }
        return cell
    }
}
//MARK: TableView Delegate
extension MovieDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Defines.movieTableRowHeight
    }
}
//MARK: CollectionView
extension MovieDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movieDetail?.genres.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categoryCollectionView.dequeueReusableCell(withClass: CategoryCollectionViewCell.self, for: indexPath)
        cell.categoryLabel.text = viewModel.movieDetail?.genres[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (viewModel.movieDetail?.genres[indexPath.row].name.count)! * 10, height: 24)
    }
}
