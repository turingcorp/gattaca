import UIKit

class MMenuItemProfile:MMenuItemProtocol
{
    let order:MMenu.Order
    let icon:UIImage
    
    required init(order:MMenu.Order)
    {
        self.order = order
        icon = #imageLiteral(resourceName: "assetGenericProfile")
    }
    
    func selected(session:MSession) -> UIViewController
    {
        let controller:CSettings = CSettings(session:session)
        
        return controller
    }
}
