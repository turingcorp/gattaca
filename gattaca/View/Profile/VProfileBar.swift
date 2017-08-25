import UIKit

class VProfileBar:View<VProfile, MProfile, CProfile>
{
    private let kBorderHeight:CGFloat = 1
    private let kContentTop:CGFloat = 20
    
    required init(controller:CProfile)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.white
        
        let border:VBorder = VBorder(colour:
            UIColor.colourBackgroundDark.withAlphaComponent(0.2))
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.font = UIFont.medium(size:16)
        labelTitle.textColor = UIColor.colourBackgroundDark
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.text = String.localizedView(
            key:"VProfileBar_labelTitle")
        
        addSubview(border)
        addSubview(labelTitle)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:labelTitle,
            toView:self,
            constant:kContentTop)
        NSLayoutConstraint.bottomToBottom(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:labelTitle,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
