import Foundation
import FirebaseDatabase

extension FDatabase
{
    func modelFromSnapshot<T:FDatabaseProtocol>(
        snapshot:DataSnapshot,
        parent:FDatabaseProtocol?,
        identifier:String?) -> T?
    {
        guard
            
            let json:Any = snapshot.value
            
        else
        {
            return nil
        }
        
        if let _:NSNull = json as? NSNull
        {
            return nil
        }
        
        var model:T? = T(
            json:json)
        
        if let parent:FDatabaseProtocol = parent
        {
            model?.parent = parent
        }
        
        if let identifier:String = identifier
        {
            model?.identifier = identifier
        }
        
        return model
    }
}
