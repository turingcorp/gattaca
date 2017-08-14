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
}
