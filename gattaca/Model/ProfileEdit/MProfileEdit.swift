import Foundation

class MProfileEdit:Model<VProfileEdit>
{
    let items:[MProfileEditItemProtocol]
    
    required init(session:MSession)
    {
        items = MProfileEdit.factoryItems()
        
        super.init(session:session)
    }
}
