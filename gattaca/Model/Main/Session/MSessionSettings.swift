import Foundation
import CoreData

extension MSession
{
    //MARK: private
    
    private func createSession(completion:@escaping((DSettings?) -> ()))
    {
        DManager.sharedInstance?.create(entity:DSettings.self)
        { (data:NSManagedObject?) in
            
            guard
            
                let settings:DSettings = data as? DSettings
            
            else
            {
                completion(nil)
                
                return
            }
            
            completion(settings)
        }
    }
    
    //MARK: internal
    
    func loadSettings(completion:@escaping((DSettings?) -> ()))
    {
        DManager.sharedInstance?.fetch(entity:DSettings.self)
        { (data:[NSManagedObject]?) in
            
            guard
                
                let settings:DSettings = data?.first as? DSettings
                
            else
            {
                self.createSession(completion:completion)
                
                return
            }
            
            settings.addTtl()
            completion(settings)
        }
    }
}
