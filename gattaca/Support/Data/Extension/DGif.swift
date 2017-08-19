import Foundation

extension DGif
{
    var mark:Mark
    {
        get
        {
            let mark:Mark = Mark(rawValue:markRaw)!
            
            return mark
        }
    }
    
    var status:Status
    {
        get
        {
            let status:Status = Status(rawValue:statusRaw)!
            
            return status
        }
    }
    
    //MARK: internal
    
    func initialValues(identifier:String)
    {
        self.identifier = identifier
        self.created = Date().timeIntervalSince1970
    }
}
