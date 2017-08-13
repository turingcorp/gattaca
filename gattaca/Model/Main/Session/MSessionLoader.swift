import Foundation
import CoreData

extension MSession
{
    //MARK: private
    
    private func createSession(
        completion:@escaping((DSession?) -> ()))
    {
        DManager.sharedInstance?.create(entity:DSession.self)
        { (data:NSManagedObject?) in
            
            guard
                
                let session:DSession = data as? DSession
                
            else
            {
                completion(nil)
                
                return
            }
            
            completion(session)
        }
    }
    
    //MARK: internal
    
    func load(completion:@escaping((DSession?) -> ()))
    {
        DManager.sharedInstance?.fetch(entity:DSession.self)
        { [weak self] (data:[NSManagedObject]?) in
            
            guard
                
                let session:DSession = data?.first as? DSession
                
            else
            {
                self?.createSession(completion:completion)
                
                return
            }
            
            completion(session)
        }
    }
}
