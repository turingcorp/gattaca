import UIKit

class CHome:Controller<VHome, MHome>
{
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(notifiedBecameActive(sender:)),
            name:NSNotification.Name.UIApplicationDidBecomeActive,
            object:nil)
     
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.loadSessionStrategy()
        }
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        model.strategy?.controllerDidAppear(controller:self)
        model.view?.viewDidAppear()
    }
    
    //MARK: notified
    
    func notifiedBecameActive(sender notification:Notification)
    {
        if parent?.childViewControllers.last === self
        {
            model.strategy?.controllerDidAppear(controller:self)
        }
    }
    
    //MARK: private
    
    private func loadSessionStrategy()
    {
        model.loadStrategy(controller:self)
    }
}
