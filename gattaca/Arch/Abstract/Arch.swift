import Foundation

protocol Arch
{
    associatedtype V
    associatedtype M
    
    var viewType:V.Type { get }
    var modelType:M.Type { get }
}
