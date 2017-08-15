import Foundation
import FirebaseDatabase

extension MFirebaseDatabase
{
    func modelFromSnapshot<T:MFirebaseDProtocol>(
        snapshot:DataSnapshot,
        parent:MFirebaseDProtocol?,
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
        
        if let parent:MFirebaseDProtocol = parent
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
