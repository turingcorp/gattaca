import Foundation

class MSession
{
    var status:MSession.Status
    private(set) var data:MSessionData?
    
    init(status:MSession.Status)
    {
        self.status = status
    }
    
    //MARK: internal
    
    func updateSession(session:DSession)
    {
        data = session.factoryData()
    }
}
