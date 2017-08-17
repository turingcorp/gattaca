import UIKit

class CLocationAsk:Controller<VLocationAsk, MLocationAsk>
{
    override var preferredStatusBarStyle:UIStatusBarStyle
    {
        return UIStatusBarStyle.lightContent
    }
    
    //MARK: internal
    
    func askLocation()
    {
        model.locationDelegate.askLocation(controller:self)
    }
    
    func authorizationChanged()
    {
        parent()?.dismissAnimateOver(completion:nil)
    }
}
