import UIKit

class VHomeActionsShare:View<VHome, MHome, CHome>
{
    private let kIdentifierButton:String = "VHomeActionsShare_button"
    
    required init(controller:CHome)
    {
        super.init(controller:controller)
        
        let button:UIButton = UIButton()
        button.accessibilityIdentifier = kIdentifierButton
        button.setImage(
            #imageLiteral(resourceName: "assetGenericShareOff"),
            for:UIControlState.normal)
        button.setImage(
            #imageLiteral(resourceName: "assetGenericShareOn"),
            for:UIControlState.highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(
            self,
            action:#selector(selectorShare(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(button)
        
        NSLayoutConstraint.equals(
            view:button,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: selectors
    
    func selectorShare(sender button:UIButton)
    {
        controller.share()
    }
}
