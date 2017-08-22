import Foundation

class FDatabaseGifs:FDatabaseProtocol
{
    var identifier:String? = "gifs"
    var parent:FDatabaseProtocol?
    
    init()
    {
    }
    
    required init?(json:Any)
    {
    }
}
