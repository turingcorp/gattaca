import UIKit

class VLocationAsk:ViewMain
{
    private let kInfoHeight:CGFloat = 90
    private let kInfoBottom:CGFloat = -40
    private let kContinueBottom:CGFloat = -30
    private let kContinueHeight:CGFloat = 70
    private let kIconTop:CGFloat = 50
    private let kIconHeight:CGFloat = 300
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.clear
        
        guard
        
            let controller:CLocationAsk = controller as? CLocationAsk
        
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
    
    private func factoryViews(controller:CLocationAsk)
    {
        let viewGradient:VGradient = VGradient.vertical(
            colourTop:UIColor.colourGradientLight,
            colourBottom:UIColor.colourGradientDark)
        
        let viewContinue:VLocationAskContinue = VLocationAskContinue(
            controller:controller)
        
        let viewInfo:VLocationAskInfo = VLocationAskInfo(
            controller:controller)
        
        let viewIcon:VLocationAskIcon = VLocationAskIcon(
            controller:controller)
        
        addSubview(viewGradient)
        addSubview(viewIcon)
        addSubview(viewInfo)
        addSubview(viewContinue)
        
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
            view:viewContinue,
            toView:self,
            constant:kContinueBottom)
        NSLayoutConstraint.height(
            view:viewContinue,
            constant:kContinueHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewContinue,
            toView:self)
        
        NSLayoutConstraint.bottomToTop(
            view:viewInfo,
            toView:viewContinue,
            constant:kInfoBottom)
        NSLayoutConstraint.height(
            view:viewInfo,
            constant:kInfoHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewInfo,
            toView:self)
    }
}
