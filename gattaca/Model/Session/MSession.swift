import Foundation

class MSession
{
    var userId:String?
    var country:String?
    var status:DSession.Status
    
    init()
    {
        status = DSession.Status.unknown
    }
    
    //MARK: internal
    
    func updateSession(session:DSession)
    {
        userId = session.userId
        country = session.country
        status = session.status
    }
}
