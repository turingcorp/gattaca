import Foundation

extension DSession
{
    //MARK: internal
    
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
    
    func initialValues()
    {
        let timestamp:TimeInterval = Date().timeIntervalSince1970
        created = timestamp
    }
}
