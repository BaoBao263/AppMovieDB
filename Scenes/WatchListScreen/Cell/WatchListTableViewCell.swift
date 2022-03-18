

import UIKit
class WatchListTableViewCell: UITableViewCell {
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var nameMovieLabel: UILabel!
    @IBOutlet weak var averageRaitingLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    let watchList = WatchListViewController()
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func fillData(movieFavorite: MovieFavorite) {
        nameMovieLabel.text = movieFavorite.title
        averageRaitingLabel.text = String(movieFavorite.rateCount)
        releaseDateLabel.text = movieFavorite.releaseDate
        posterImage.getImageFromUrl(url: movieFavorite.posterImage)
    }
    
    @IBAction func didTapGoToMovieDetailScreen(_ sender: UIButton) {
    }
    @IBAction func didTapDeleteMovieButton(_ sender: UIButton) {
        watchList.delete()
    }
}
