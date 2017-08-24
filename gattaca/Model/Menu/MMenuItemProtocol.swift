import UIKit

protocol MMenuItemProtocol
{
    var icon:UIImage { get }
    var order:MMenu.Order { get }
    var signature:ModelSignature<Any> { get }
    
    init(order:MMenu.Order)
}
