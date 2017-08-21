import Foundation

extension MSession
{
    //MARK: private
    
    private func loadCompleted(
        coreData:Database,
        data:[DSession],
        completion:@escaping(() -> ()))
    {
        guard
            
            let session:DSession = data.first
            
        else
        {
            create(
                coreData:coreData)
            { [weak self] (session:DSession) in
                
                self?.syncFirebase(
                    coreData:coreData,
                    session:session,
                    completion:completion)
            }
            
            return
        }
        
        syncFirebase(
            coreData:coreData,
            session:session,
            completion:completion)
    }
    
    //MARK: internal
    
    func load(
        coreData:Database,
        completion:@escaping(() -> ()))
    {
        coreData.fetch
        { [weak self] (data:[DSession]) in
            
            self?.loadCompleted(
                coreData:coreData,
                data:data,
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
