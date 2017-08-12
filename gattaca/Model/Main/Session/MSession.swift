import Foundation

class MSession
{
    static let sharedInstance:MSession = MSession()
    
    let gif:MGif
    private(set) var settings:DSettings?
    
    private init()
    {
        gif = MGif()
    }
    
    //MARK: internal
    
    func loadSession()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        {
            self.asyncLoadSession()
        }
    }
    
    func settingsLoaded(settings:DSettings)
    {
        self.settings = settings
        loadPerks(settings:settings)
    }
    
    func finishedLoadingSession()
    {
        DManager.sharedInstance?.save()
        
        NotificationCenter.default.post(
            name:Notification.sessionLoaded,
            object:nil)
    }
}
