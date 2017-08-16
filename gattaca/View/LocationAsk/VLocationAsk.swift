import UIKit

class VLocationAsk:ViewMain
{
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
        
        addSubview(viewGradient)
        
        NSLayoutConstraint.equals(
            view:viewGradient,
            toView:self)
    }
}
