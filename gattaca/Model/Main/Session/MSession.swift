import Foundation

class MSession
{
    private(set) var status:MSession.Status
    private(set) var settings:DSettings?
    
    private init()
    {
        status = MSession.Status.new
    }
    
    //MARK: private
    
    private func asyncLoadSession(completion:@escaping(() -> ()))
    {
        loadSettings
        { (settings:DSettings?) in
            
            self.settings = settings
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
