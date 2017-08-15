import Foundation

extension MSession
{
    //MARK: internal
    
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
