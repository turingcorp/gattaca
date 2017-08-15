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
            
            let manager:DManager = DManager(bundle:nil)
            
        else
        {
            return
        }
        
        load(manager:manager)
        { [weak self] (session:DSession) in

            self?.sessionLoaded(
                manager:manager,
                session:session,
                completion:completion)
        }
    }
    
    private func sessionLoaded(
        manager:DManager,
        session:DSession,
        completion:@escaping(() -> ()))
    {
        self.session = session
        status = MSession.Status.sync
        
        sync(manager:manager,
             session:session)
        { [weak self] in
            
            self?.sessionSynched(completion:completion)
        }
    }
    
    private func sessionSynched(
        completion:@escaping(() -> ()))
    {
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
