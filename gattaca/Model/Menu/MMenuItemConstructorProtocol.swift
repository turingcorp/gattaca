import Foundation

protocol MMenuItemConstructorProtocol
{
    associatedtype V:ViewMain
    associatedtype M:Model<Self.V>
    associatedtype C:Controller<Self.V, Self.M>
    
    var controller:C.Type { get }
}
