import Foundation

class FDatabaseCountries:FDatabaseProtocol
{
    var identifier:String? = "countries"
    var parent:FDatabaseProtocol?
    
    init()
    {
    }
    
    required init?(json:Any)
    {
    }
}
