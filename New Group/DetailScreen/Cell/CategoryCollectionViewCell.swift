
import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        config()
    }

    func config() {
        categoryLabel.layer.cornerRadius = Defines.cornerRadius
        categoryLabel.clipsToBounds = true
    }
}
