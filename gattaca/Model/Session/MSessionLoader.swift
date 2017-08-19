import Foundation

extension MSession
{
    //MARK: private
    
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
    
    func load(
        coreData:Database,
        completion:@escaping(() -> ()))
    {
        coreData.fetch
        { [weak self] (data:[DSession]) in
            
            guard
                
                let session:DSession = data.first
                
            else
            {
                self?.create(
                    coreData:coreData)
                { [weak self] (session:DSession) in
                    
                    self?.sessionLoaded(
                        coreData:coreData,
                        session:session,
                        completion:completion)
                }
                
                return
            }
            
            self?.sessionLoaded(
                coreData:coreData,
                session:session,
                completion:completion)
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
