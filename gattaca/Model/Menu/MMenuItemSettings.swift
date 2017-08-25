import UIKit

class MMenuItemSettings:MMenuItemProtocol
{
    let order:MMenu.Order
    let icon:UIImage
    
    required init(order:MMenu.Order)
    {
        self.order = order
        icon = #imageLiteral(resourceName: "assetGenericSettings")
    }
    
    func selected(session:MSession) -> UIViewController
    {
        let controller:CSettings = CSettings(session:session)
        
        return controller
    }
}
