import UIKit

class ReviewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func fillData(with review: Review) {
        contentLabel.text = review.content
        nameLabel.text = review.reviewerName
        ratingLabel.text = "\(review.reviewerInfo.rating ?? 0)"
        if let avatar = review.avatar {
            avatarImage.getImageFromUrl(url: avatar)
        }
    }
}

