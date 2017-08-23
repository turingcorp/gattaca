import UIKit

protocol MMenuItemProtocol
{
    associatedtype V:ViewMain
    associatedtype M:Model<Self.V>
    associatedtype C:Controller<Self.V, Self.M>
    
    var icon:UIImage { get }
    var order:MMenu.Order { get }
    var controller:C.Type { get }
    
    init(order:MMenu.Order)
}
