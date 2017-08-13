import Foundation

class MSession
{
    private(set) var status:MSession.Status
    private(set) var session:DSession?
    
    init()
    {
        status = MSession.Status.new
    }
    
    //MARK: private
    
    private func asyncLoad(completion:@escaping(() -> ()))
    {
        guard
            
            let manager:DManager = DManager()
            
        else
        {
            return
        }
        
        load(manager:manager)
        { [weak self] (session:DSession) in
            
            self?.session = session
            manager.save()
            
            completion()
        }
    }
    
    //MARK: internal
    
    func load(completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoad(completion:completion)
        }
    }
}
