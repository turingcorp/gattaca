import Foundation
import FirebaseDatabase

class MFirebaseDManager
{
    let reference:DatabaseReference
    let root:String
    
    init(bundle:Bundle?)
    {
        reference = Database.database().reference()
        root = MFirebaseDManager.factoryRoot(bundle:bundle)
    }
    
    //MARK: internal
    
    func create(
        parent:MFirebaseDProtocol,
        data:Any) -> String
    {
        let path:String = modelPath(model:parent)
        let reference:DatabaseReference = self.reference.child(
            path).childByAutoId()
        reference.setValue(data)
        
        let childId:String = reference.key
        
        return childId
    }
    
    func load<T:MFirebaseDProtocol>(
        parent:MFirebaseDProtocol?,
        identifier:String?,
        completion:@escaping((T?) -> ()))
    {
        let path:String = modelPath(
            parent:parent,
            identifier:identifier)
        
        let reference:DatabaseReference = self.reference.child(path)
        reference.observeSingleEvent(of:DataEventType.value)
        { (snapshot:DataSnapshot) in
            
            guard
                
                let json:Any = snapshot.value
                
            else
            {
                completion(nil)
                
                return
            }
            
            if let _:NSNull = json as? NSNull
            {
                completion(nil)
            }
            
            let model:T? = T(
                json:json,
                identifier:identifier)
            
            completion(model)
        }
    }
}
