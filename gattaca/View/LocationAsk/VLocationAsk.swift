import UIKit

class VLocationAsk:ViewMain
{
    private let kInfoHeight:CGFloat = 95
    private let kContinueBottom:CGFloat = -20
    private let kContinueHeight:CGFloat = 80
    
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
        
        addSubview(viewGradient)
        addSubview(viewInfo)
        addSubview(viewContinue)
        
        NSLayoutConstraint.equals(
            view:viewGradient,
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
            toView:viewContinue)
        NSLayoutConstraint.height(
            view:viewInfo,
            constant:kInfoHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewInfo,
            toView:self)
    }
}
