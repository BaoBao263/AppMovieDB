
import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoriesLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        config()
    }
    func config() {
        categoriesLabel.layer.cornerRadius = 8
        categoriesLabel.clipsToBounds = true
    }

}
