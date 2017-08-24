import Foundation

protocol Arch
{
    associatedtype V:ViewMain
    associatedtype M:Model<Self.V>
    associatedtype C:Controller<Any>
    
    var viewType:V.Type { get }
    var modelType:M.Type { get }
    var controllerType:C.Type { get }
}
