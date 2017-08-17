import UIKit

class CLocationDenied:Controller<VLocationDenied, MLocationDenied>
{
    override var preferredStatusBarStyle:UIStatusBarStyle
    {
        return UIStatusBarStyle.lightContent
    }
    
    //MARK: private
    
    private func back()
    {
        parent()?.dismissAnimateOver(completion:nil)
    }
}
