import Foundation

protocol Signature
{
    associatedtype V
    
    var viewType:V.Type { get }
//    associatedtype M:Model<Self.V>
//    associatedtype C:Controller<Self.V, Self.M>
    
//    var controller:C.Type? { get }
}
