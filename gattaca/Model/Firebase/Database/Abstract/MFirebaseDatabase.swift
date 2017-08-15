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
        { [weak self] (snapshot:DataSnapshot) in
            
            let model:T? = self?.modelFromSnapshot(
                snapshot:snapshot,
                parent:parent,
                identifier:identifier)
            
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
