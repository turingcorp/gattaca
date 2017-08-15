import Foundation

protocol MFirebaseDProtocol
{
    var identifier:String? { get set }
    var parent:MFirebaseDProtocol? { get }
    var path:String { get }
    var json:Any? { get }
    
    init?(json:Any)
}
