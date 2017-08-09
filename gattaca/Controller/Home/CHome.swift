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
            
            self?.dispatchRefresh()
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(notifiedSessionLoaded(sender:)),
            name:Notification.sessionLoaded,
            object:nil)
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        view().viewDidAppear()
    }
    
    //MARK: notified
    
    func notifiedSessionLoaded(sender notification:Notification)
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.dispatchSessionLoaded()
        }
    }
    
    func notifiedBecameActive(sender notification:Notification)
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.dispatchBecameActive()
        }
    }
    
    //MARK: private
    
    private func dispatchSessionLoaded()
    {
        model.requestGiphyTrending()
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(notifiedBecameActive(sender:)),
            name:NSNotification.Name.UIApplicationDidBecomeActive,
            object:nil)
    }
    
    private func dispatchRefresh()
    {
        view().refresh()
    }
    
    private func dispatchBecameActive()
    {
        view().viewDidAppear()
    }
}
