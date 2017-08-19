import Foundation

extension DGif
{
    var mark:DGif.Mark
    {
        get
        {
            guard
            
                let mark:Mark = Mark(rawValue:rawMark)
            
            else
            {
                return DGif.Mark.none
            }
            
            return mark
        }
        
        set
        {
            rawMark = newValue.rawValue
        }
    }
    
    var status:DGif.Status
    {
        get
        {
            guard
            
                let status:Status = Status(rawValue:rawStatus)
            
            else
            {
                return DGif.Status.new
            }
            
            return status
        }
        
        set
        {
            rawStatus = newValue.rawValue
        }
    }
    
    //MARK: internal
    
    func initialValues(identifier:String)
    {
        self.identifier = identifier
        self.created = Date().timeIntervalSince1970
    }
}
