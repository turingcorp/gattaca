import Foundation

class FDatabaseGifsUserItem:FDatabaseProtocol
{
    var identifier:String?
    var parent:FDatabaseProtocol?
    let mark:DGif.Mark
    
    var json:Any?
    {
        get
        {
            return mark.rawValue
        }
    }
    
    init(
        user:FDatabaseGifsUser,
        identifier:String,
        mark:DGif.Mark)
    {
        self.identifier = identifier
        self.mark = mark
        parent = user
    }
    
    required init?(json:Any)
    {
        guard
            
            let rawMark:Int16 = json as? Int16,
            let mark:DGif.Mark = DGif.Mark(rawValue:rawMark)
        
        else
        {
            return nil
        }
        
        self.mark = mark
    }
}
