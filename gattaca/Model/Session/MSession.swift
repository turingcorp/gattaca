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
        
        print("a")
        
        load(manager:manager)
        { [weak self] (session:DSession) in

            print("b")
            
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
        print("c")
        self.session = session
        status = MSession.Status.sync
        
        sync(manager:manager,
             session:session)
        { [weak self] in
            
            print("d")
            self?.sessionSynched(completion:completion)
        }
    }
    
    private func sessionSynched(
        completion:@escaping(() -> ()))
    {
        print("e")
        
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
