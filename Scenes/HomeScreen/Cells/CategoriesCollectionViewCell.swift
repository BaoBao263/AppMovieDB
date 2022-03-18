
import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoriesLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        config()
    }
    override var isSelected: Bool {
        didSet{
            if isSelected {
                categoriesLabel.backgroundColor = UIColor(red: 85/255, green: 203/255, blue: 164/255, alpha: 1)
                categoriesLabel.font = UIFont(name: "Poppins-SemiBold", size: 12)
                categoriesLabel.textColor = .black
                
            } else {
                categoriesLabel.backgroundColor = UIColor(red: 74/255, green: 80/255, blue: 89/255, alpha: 1)
                categoriesLabel.font = UIFont(name: "Poppins-Regular", size: 12)
                categoriesLabel.textColor = .white
            }
        }
    }
    
    func config() {
        categoriesLabel.layer.cornerRadius = Defines.cornerRadius
        categoriesLabel.clipsToBounds = true
    }

}
