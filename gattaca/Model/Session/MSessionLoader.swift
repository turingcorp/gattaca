import Foundation
import CoreData

extension MSession
{
    //MARK: internal
    
    func load(
        manager:DManager,
        completion:@escaping((DSession) -> ()))
    {
        manager.fetch(entity:DSession.self)
        { [weak self] (data:[NSManagedObject]?) in
            
            guard
                
                let session:DSession = data?.first as? DSession
                
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
        manager.create(entity:DSession.self)
        { (data:NSManagedObject?) in
            
            guard
            
                let session:DSession = data as? DSession
            
            else
            {
                return
            }
            
            manager.save
            {
                completion(session)
            }
        }
    }
}
