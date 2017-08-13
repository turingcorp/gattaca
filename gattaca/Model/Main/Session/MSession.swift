import Foundation

class MSession
{
    private(set) var status:MSession.Status
    private(set) var session:DSession?
    
    private init()
    {
        status = MSession.Status.new
    }
    
    //MARK: private
    
    private func asyncLoad(completion:@escaping(() -> ()))
    {
        load
        { [weak self] (session:DSession?) in
        
            self?.session = session
            DManager.sharedInstance?.save()
            
            completion()
        }
    }
    
    //MARK: internal
    
    func load(completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        {
            self.asyncLoad(completion:completion)
        }
    }
}
