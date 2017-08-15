import Foundation
import FirebaseDatabase

class MFirebaseDatabase
{
    let reference:DatabaseReference
    let root:String
    
    init(bundle:Bundle?)
    {
        reference = Database.database().reference()
        root = MFirebaseDatabase.factoryRoot(bundle:bundle)
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
            
            completion(model)
        }
    }
    
    func update(model:MFirebaseDProtocol)
    {
        guard
            
            let json:Any = model.json
            
        else
        {
            return
        }
        
        let path:String = modelPath(model:model)
        let reference:DatabaseReference = self.reference.child(path)
        reference.setValue(json)
    }
}
