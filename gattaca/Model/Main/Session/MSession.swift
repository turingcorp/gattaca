import Foundation

class MSession
{
    static let sharedInstance:MSession = MSession()
    
    private(set) var status:MSession.Status
    private(set) var settings:DSettings?
    
    private init()
    {
        gif = MGif()
        status = MSession.Status.new
    }
    
    //MARK: private
    
    private func asyncLoadSession(completion:@escaping(() -> ()))
    {
        loadSettings
        { (settings:DSettings?) in
            
            self.settings = settings
            self.asyncLoadPerks(completion:completion)
        }
    }
    
    private func asyncLoadPerks(completion:@escaping(() -> ()))
    {
        loadPerks
        {
            self.asyncLoadGifs(completion:completion)
        }
    }
    
    private func asyncLoadGifs(completion:@escaping(() -> ()))
    {
        loadGifs
        {
            self.asyncLoadComplete(completion:completion)
        }
    }
    
    private func asyncLoadComplete(completion:@escaping(() -> ()))
    {
        DManager.sharedInstance?.save()
        completion()
    }
    
    //MARK: internal
    
    func loadSession(completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        {
            self.asyncLoadSession(completion:completion)
        }
    }
}
