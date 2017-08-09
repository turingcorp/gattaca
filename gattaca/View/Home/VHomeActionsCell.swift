import UIKit

class VHomeActionsCell:UICollectionViewCell
{
    private weak var background:UIImageView!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let background:UIImageView = UIImageView()
        background.clipsToBounds = true
        background.contentMode = UIViewContentMode.center
        background.translatesAutoresizingMaskIntoConstraints = false
        background.isUserInteractionEnabled = false
        self.background = background
        
        addSubview(background)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
