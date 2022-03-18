
import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        config()
    }

    func config() {
        categoryLabel.layer.cornerRadius = categoryLabel.frame.size.height / 3.7
        categoryLabel.clipsToBounds = true
    }
}
