import Foundation

protocol FDatabaseProtocol
{
    var identifier:String? { get set }
    var parent:FDatabaseProtocol? { get set }
    var path:String { get }
    var json:Any? { get }
    
    init?(json:Any)
    
    func child(identifier:String) -> String
}
