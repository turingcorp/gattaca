import Foundation
import CoreData

extension MSession
{
    //MARK: internal
    
    func createSession(
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
            
            completion(session)
        }
    }
    
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
                self?.createSession(
                    manager:manager,
                    completion:completion)
                
                return
            }
            
            completion(session)
        }
    }
}
