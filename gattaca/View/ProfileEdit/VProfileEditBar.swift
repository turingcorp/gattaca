import UIKit

class VProfileEditBar:View<VProfileEdit, MProfileEdit, CProfileEdit>
{
    private let kBorderHeight:CGFloat = 1
    private let kContentTop:CGFloat = 20
    private let kDoneWidth:CGFloat = 120
    
    required init(controller:CProfileEdit)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.white
        
        let border:VBorder = VBorder(
            colour:UIColor.colourBackgroundDark.withAlphaComponent(0.2))
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.font = UIFont.medium(size:15)
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.text = String.localizedView(
            key:"VProfileEditBar_labelTitle")
        
        let viewDone:VProfileEditDone = VProfileEditDone(
            controller:controller)
        
        addSubview(border)
        addSubview(labelTitle)
        addSubview(viewDone)
        
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
        
        NSLayoutConstraint.topToTop(
            view:viewDone,
            toView:self,
            constant:kContentTop)
        NSLayoutConstraint.bottomToBottom(
            view:viewDone,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:viewDone,
            toView:self)
        NSLayoutConstraint.width(
            view:viewDone,
            constant:kDoneWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
