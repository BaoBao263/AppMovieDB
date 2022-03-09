
import UIKit

class ListMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var nameMovieLabel: UILabel!
    @IBOutlet weak var averageRaitingLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    var dataTaskPosterImage: URLSessionDataTask?
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        dataTaskPosterImage?.cancel()
        posterImage.image = nil
    }
    func fillData(with movie: Movie?) {
        dataTaskPosterImage = posterImage.loadImageFromUrl(imageUrl: movie?.posterImage?.mergeUrl ?? "")
        nameMovieLabel.text = movie?.title
        releaseDateLabel.text = movie?.releaseDate
        if let movieRaiting = movie?.popularity {
        averageRaitingLabel.text = ("\(movieRaiting)")
        }
    }
}
