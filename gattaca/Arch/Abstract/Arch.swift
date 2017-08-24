import Foundation

protocol Arch
{
    associatedtype V
    
    var viewType:V.Type { get }
}
