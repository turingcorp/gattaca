import Foundation

extension CHome
{
    //MARK: internal
    
    func loadSessionStrategy()
    {
        model.loadStrategy(controller:self)
    }
    
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
