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
            
            guard
                
                let strongSelf:CHome = self
            
            else
            {
                return
            }
            
            strongSelf.model.loadStrategy(controller:strongSelf)
        }
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        view().viewDidAppear()
    }
    
    //MARK: notified
    
    func notifiedBecameActive(sender notification:Notification)
    {
        view().viewDidAppear()
    }
    
    //MARK: private
    
    private func asyncRefresh()
    {
        view().refresh()
    }
    
    //MARK: internal
    
    func sessionLoaded()
    {
        
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(notifiedBecameActive(sender:)),
            name:NSNotification.Name.UIApplicationDidBecomeActive,
            object:nil)
    }
    
    func sessionReady()
    {
        model.loadItems()
    }
}
