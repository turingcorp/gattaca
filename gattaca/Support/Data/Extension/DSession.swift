import Foundation

extension DSession
{
    var status:DSession.Status
    {
        get
        {
            let status:DSession.Status = DSession.Status(rawValue:rawStatus)!
            
            return status
        }
        
        set
        {
            rawStatus = newValue.rawValue
        }
    }
}
