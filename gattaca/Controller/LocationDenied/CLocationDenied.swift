import UIKit

class CLocationDenied:Controller<VLocationAsk, MLocationAsk>
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
