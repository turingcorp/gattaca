import UIKit

class VProfileCard:View<VProfile, MProfile, CProfile>
{
    private let kBorderHeight:CGFloat = 1
    
    required init(controller:CProfile)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.colourSuccess
        isUserInteractionEnabled = false
        
        let border:VBorder = VBorder(
            colour:UIColor(white:0, alpha:0.2))
        
        addSubview(border)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
