import UIKit

class VLocationAskIcon:
    View<VLocationAsk, MLocationAsk, CLocationAsk>
{
    required init(controller:CLocationAsk)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
        
        let background:UIImageView = UIImageView()
        background.isUserInteractionEnabled = false
        background.translatesAutoresizingMaskIntoConstraints = false
        background.clipsToBounds = true
        background.contentMode = UIViewContentMode.center
        background.image = #imageLiteral(resourceName: "assetGenericCircle")
        
        let icon:UIImageView = UIImageView()
        icon.isUserInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.center
        icon.image = #imageLiteral(resourceName: "assetGenericLocation")
        
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
}
