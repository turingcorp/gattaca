import UIKit

class CHome:Controller<VHome, MHome>
{
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func modelRefresh()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.asyncRefresh()
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
     
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.loadSessionStrategy()
        }
    }
    
    //MARK: notified
    
    func notifiedBecameActive(sender notification:Notification)
    {
        model.loadLocation(controller:self)
    }
    
    //MARK: private
    
    private func asyncRefresh()
    {
    }
}
