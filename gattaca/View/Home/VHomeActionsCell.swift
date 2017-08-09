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
    
    override var isSelected:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    override var isHighlighted:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    //MARK: private
    
    func hover()
    {
        if isSelected || isHighlighted
        {
            background.image = #imageLiteral(resourceName: "assetGenericActionOn")
        }
        else
        {
            background.image = #imageLiteral(resourceName: "assetGenericActionOff")
        }
    }
    
    //MARK: internal
    
    func config(model:MHomeActionProtocol)
    {
        hover()
    }
}
