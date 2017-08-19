import Foundation

extension DGif
{
    var mark:DGif.Mark
    {
        get
        {
            guard
            
                let mark:Mark = Mark(rawValue:markRaw)
            
            else
            {
                return DGif.Mark.none
            }
            
            return mark
        }
    }
    
    var status:DGif.Status
    {
        get
        {
            guard
            
                let status:Status = Status(rawValue:statusRaw)
            
            else
            {
                return DGif.Status.new
            }
            
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
