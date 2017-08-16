import Foundation

class MSession
{
    private(set) var status:MSession.Status
    private(set) var session:DSession?
    private var locationHandler:(() -> ())?
    
    init(status:MSession.Status)
    {
        self.status = status
    }
    
    //MARK: private
    
    private func asyncLoad(completion:@escaping(() -> ()))
    {
        guard
            
            let coreData:Database = Database(bundle:nil)
            
        else
        {
            return
        }
        
        load(coreData:coreData)
        { [weak self] (session:DSession) in

            self?.sessionLoaded(
                coreData:coreData,
                session:session,
                completion:completion)
        }
    }
    
    private func sessionLoaded(
        coreData:Database,
        session:DSession,
        completion:@escaping(() -> ()))
    {
        self.session = session
        status = MSession.Status.sync
        
        sync(coreData:coreData,
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
    
    func authLocation(completion:@escaping(() -> ()))
    {
        locationHandler = completion
        status = MSession.Status.authLocation
    }
}
