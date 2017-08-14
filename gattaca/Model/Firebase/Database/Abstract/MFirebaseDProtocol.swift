import Foundation

protocol MFirebaseDProtocol
{
    static var parent:MFirebaseDProtocol.Type? { get }
    var identifier:String { get }
    var path:String { get }
    var json:Any? { get }
    
    init?(snapshot:Any)
}
