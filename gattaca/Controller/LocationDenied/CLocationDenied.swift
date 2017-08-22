import UIKit

class CLocationDenied:Controller<VLocationDenied, MLocationDenied>
{
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
    
    override var preferredStatusBarStyle:UIStatusBarStyle
    {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(notifiedBecameActive(sender:)),
            name:NSNotification.Name.UIApplicationDidBecomeActive,
            object:nil)
    }
    
    //MARK: notified
    
    func notifiedBecameActive(sender notification:Notification)
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.back()
        }
    }
    
    //MARK: private
    
    private func back()
    {
        parentController?.dismissAnimateOver(completion:nil)
    }
}
