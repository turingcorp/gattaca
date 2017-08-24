import UIKit

protocol MMenuItemProtocol
{
    var icon:UIImage { get }
    var order:MMenu.Order { get }
    
    init(order:MMenu.Order)
}
