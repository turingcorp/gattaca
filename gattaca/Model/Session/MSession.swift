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
}
