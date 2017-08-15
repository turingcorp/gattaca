import Foundation

extension DSession
{
    //MARK: internal
    
    var status:DSession.Status
    {
        get
        {
            guard
            
                let status:DSession.Status = DSession.Status(rawValue:rawStatus)
            
            else
            {
                return DSession.Status.unknown
            }
            
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
