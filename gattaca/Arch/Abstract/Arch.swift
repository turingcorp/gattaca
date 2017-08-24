import Foundation

protocol Arch
{
    associatedtype V:ViewMain
    associatedtype M:Model<Self.V>
    associatedtype C:Controller<Self.V, Self.M>
    
    var viewType:V.Type { get }
    var modelType:M.Type { get }
    var controllerType:C.Type { get }
}
