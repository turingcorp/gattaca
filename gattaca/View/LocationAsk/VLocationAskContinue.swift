import UIKit

class VLocationAskContinue:
    View<VLocationAsk, MLocationAsk, CLocationAsk>
{
    private weak var layoutButtonLeft:NSLayoutConstraint!
    private let kButtonWidth:CGFloat = 200
    
    required init(controller:CLocationAsk)
    {
        super.init(controller:controller)
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(
            #imageLiteral(resourceName: "assetGenericButton"),
            for:UIControlState.normal)
        button.imageView!.clipsToBounds = true
        button.imageView!.contentMode = UIViewContentMode.center
        button.setTitle(
            String.localizedView(key:"VLocationAskContinue_button"),
            for:UIControlState.normal)
        button.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        button.setTitleColor(
            UIColor(white:1, alpha:0.2),
            for:UIControlState.highlighted)
        
        addSubview(button)
        
        NSLayoutConstraint.equalsVertical(
            view:button,
            toView:self)
        layoutButtonLeft = NSLayoutConstraint.leftToLeft(
            view:button,
            toView:self)
        NSLayoutConstraint.width(
            view:button,
            constant:kButtonWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.width
        let remainWidth:CGFloat = width - kButtonWidth
        let marginLeft:CGFloat = remainWidth / 2.0
        layoutButtonLeft.constant = marginLeft
        
        super.layoutSubviews()
    }
    
    //MARK: selectors
    
    func selectorButton(sender button:UIButton)
    {
        
    }
}
