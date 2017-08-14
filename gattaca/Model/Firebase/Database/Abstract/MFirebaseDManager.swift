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
    
    //MARK: private
    
    private func modelPath(model:MFirebaseDProtocol) -> String
    {
        var path:String = root
        path.append(model.path)
        
        return path
    }
    
    //MARK: internal
    
    func create(
        parent:MFirebaseDProtocol,
        data:Any) -> String
    {
        let path:String = modelPath(model:parent)
        let childReference:DatabaseReference = reference.child(
            path).childByAutoId()
        childReference.setValue(data)
        
        let childId:String = childReference.key
        
        return childId
    }
}
