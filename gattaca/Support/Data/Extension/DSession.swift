import Foundation

extension DSession
{
    //MARK: internal
    
    var status:DSession.Status
    {
        get
        {
            guard
            
                let status:DSession.Status = DSession.Status(
                    rawValue:rawStatus)
            
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
        created = Date().timeIntervalSince1970
    }
}
