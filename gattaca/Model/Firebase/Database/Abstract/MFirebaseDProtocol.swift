import Foundation

protocol MFirebaseDProtocol
{
    var identifier:String? { get }
    var parent:MFirebaseDProtocol? { get set }
    var path:String { get }
    var json:Any? { get }
    
    init?(json:Any, identifier:String?)
}
