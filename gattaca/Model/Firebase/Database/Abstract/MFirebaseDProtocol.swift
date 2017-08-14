import Foundation

protocol MFirebaseDProtocol
{
    var identifier:String? { get }
    var parent:MFirebaseDProtocol? { get }
    var path:String { get }
    var json:Any? { get }
    
    init?(snapshot:Any?, identifier:String?)
}
