import UIKit

class VProfileEditDone:View
    <VProfileEdit, MProfileEdit, CProfileEdit>
{
    private let kLabelMarginRight:CGFloat = -10
    
    required init(controller:CProfileEdit)
    {
        super.init(controller:controller)
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.textAlignment = NSTextAlignment.right
        labelTitle.font = UIFont.bold(size:15)
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.textColor = UIColor.colourSuccess
        labelTitle.text = String.localizedView(
            key:"VProfileEditDone_labelTitle")
        
        addSubview(labelTitle)
        
        NSLayoutConstraint.equalsVertical(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:labelTitle,
            toView:self,
            constant:kLabelMarginRight)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
