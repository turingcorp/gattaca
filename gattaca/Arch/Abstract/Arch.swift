import Foundation

protocol Arch
{
    associatedtype V:ViewMain
    associatedtype M:Model<Self.V>
    
    var viewType:V.Type { get }
    var modelType:M.Type { get }
}
