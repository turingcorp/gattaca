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

            manager.save()
            self?.sessionLoaded(
                session:session,
                completion:completion)
        }
    }
    
    private func sessionLoaded(
        session:DSession,
        completion:@escaping(() -> ()))
    {
        self.session = session
        status = MSession.Status.loaded
        
        completion()
    }
    
    //MARK: internal
    
    func load(completion:@escaping(() -> ()))
    {
        status = MSession.Status.loading
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoad(completion:completion)
        }
    }
}
