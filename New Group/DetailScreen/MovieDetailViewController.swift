import UIKit

class MovieDetailViewController: UIViewController {
    @IBOutlet private weak var backGroundImageView: UIImageView!
    @IBOutlet private weak var avatarImage: UIImageView!
    @IBOutlet private weak var nameMovieLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var averageRatingLabel: UILabel!
    @IBOutlet private weak var rateCountLabel: UILabel!
    @IBOutlet private weak var popularityLabel: UILabel!
    
    var viewModel: MovieDetailViewModel!
    var coordinator: MovieDetailCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovieDetail()
        configViewModel()
    }
    
    @IBAction func didTapPopToHomeScreenButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}


//MARK: Fetch data
extension MovieDetailViewController {
    
    func updateUI() {
        if let backdropImage = viewModel.movieDetail?.backgroundImage {
            backGroundImageView.getImageFromUrl(url: backdropImage)
        }
        if let posterImage = viewModel.movieDetail?.posterImage {
            avatarImage.getImageFromUrl(url: posterImage)
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
    }
    
    func configViewModel() {
        viewModel.notify = { [weak self] in
            DispatchQueue.main.async {
                self?.updateUI()
            }
        }
    }
}
