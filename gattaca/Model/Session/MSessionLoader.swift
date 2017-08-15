import Foundation

extension MSession
{
    //MARK: internal
    
    func load(
        manager:DManager,
        completion:@escaping((DSession) -> ()))
    {
        manager.fetch
        { [weak self] (data:[DSession]) in
            
            guard
                
                let session:DSession = data.first
                
            else
            {
                self?.create(
                    manager:manager,
                    completion:completion)
                
                return
            }
            
            completion(session)
        }
    }
    
    func create(
        manager:DManager,
        completion:@escaping((DSession) -> ()))
    {
        manager.create
        { (session:DSession) in
            
            manager.save
            {
                completion(session)
            }
        }
    }
}
