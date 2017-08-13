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
        model.loadItems()
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(notifiedBecameActive(sender:)),
            name:NSNotification.Name.UIApplicationDidBecomeActive,
            object:nil)
    }
}
