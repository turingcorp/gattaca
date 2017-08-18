import UIKit

class VLocationDenied:ViewMain
{
    private let kInfoHeight:CGFloat = 90
    private let kInfoBottom:CGFloat = -140
    private let kIconTop:CGFloat = 50
    private let kIconHeight:CGFloat = 300
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.clear
        
        guard
            
            let controller:CLocationDenied = controller as? CLocationDenied
            
        else
        {
            return
        }
        
        factoryViews(controller:controller)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func factoryViews(controller:CLocationDenied)
    {
        let colourTop:UIColor = UIColor(
            red:1,
            green:0.5215686274509804,
            blue:0.43529411764705883,
            alpha:1)
        
        let colourBottom:UIColor = UIColor(
            red:0.8627450980392157,
            green:0.3529411764705883,
            blue:0.2588235294117647,
            alpha:1)
        
        let viewGradient:VGradient = VGradient.vertical(
            colourTop:colourTop,
            colourBottom:colourBottom)
        
        let viewInfo:VLocationDeniedInfo = VLocationDeniedInfo(
            controller:controller)
        
        let viewIcon:VLocationDeniedIcon = VLocationDeniedIcon(
            controller:controller)
        
        addSubview(viewGradient)
        addSubview(viewIcon)
        addSubview(viewInfo)
        
        NSLayoutConstraint.equals(
            view:viewGradient,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:viewIcon,
            toView:self,
            constant:kIconTop)
        NSLayoutConstraint.height(
            view:viewIcon,
            constant:kIconHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewIcon,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:viewInfo,
            toView:self,
            constant:kInfoBottom)
        NSLayoutConstraint.height(
            view:viewInfo,
            constant:kInfoHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewInfo,
            toView:self)
    }
}
