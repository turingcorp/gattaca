import UIKit

class VHomeActionsCell:UICollectionViewCell
{
    private weak var background:UIImageView!
    private weak var icon:UIImageView!
    
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
        
        let icon:UIImageView = UIImageView()
        icon.isUserInteractionEnabled = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.center
        icon.translatesAutoresizingMaskIntoConstraints = false
        self.icon = icon
        
        addSubview(background)
        addSubview(icon)
        
        NSLayoutConstraint.equals(
            view:background,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:icon,
            toView:self)
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
            icon.tintColor = UIColor.colourBackgroundDark
        }
        else
        {
            background.image = #imageLiteral(resourceName: "assetGenericActionOff")
            icon.tintColor = UIColor.white
        }
    }
    
    //MARK: internal
    
    func config(model:MHomeActionProtocol)
    {
        icon.image = model.icon.withRenderingMode(
            UIImageRenderingMode.alwaysTemplate)
        
        hover()
    }
}
