import Foundation

extension MSession
{
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
    
    func load(
        coreData:Database,
        completion:@escaping((DSession) -> ()))
    {
        coreData.fetch
        { [weak self] (data:[DSession]) in
            
            guard
                
                let session:DSession = data.first
                
            else
            {
                self?.create(
                    coreData:coreData,
                    completion:completion)
                
                return
            }
            
            completion(session)
        }
    }
    
    func create(
        coreData:Database,
        completion:@escaping((DSession) -> ()))
    {
        coreData.create
        { (session:DSession) in
            
            session.initialValues()
            
            coreData.save
            {
                completion(session)
            }
        }
    }
}
