import Foundation
import FirebaseDatabase

class FDatabase
{
    let reference:DatabaseReference
    
    init()
    {
        reference = Database.database().reference()
    }
    
    //MARK: internal
    
    func create(
        parent:FDatabaseProtocol,
        data:Any) -> String
    {
        let path:String = parent.path
        let reference:DatabaseReference = self.reference.child(
            path).childByAutoId()
        reference.setValue(data)
        
        let childId:String = reference.key
        
        return childId
    }
    
    func load<T:FDatabaseProtocol>(
        parent:FDatabaseProtocol?,
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
    
    func update(model:FDatabaseProtocol)
    {
        guard
            
            let json:Any = model.json
            
        else
        {
            return
        }
        
        let path:String = model.path
        let reference:DatabaseReference = self.reference.child(path)
        reference.setValue(json)
    }
}