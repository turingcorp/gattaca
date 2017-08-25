import UIKit

class MMenuItemMatch:MMenuItemProtocol
{
    let order:MMenu.Order
    let icon:UIImage
    
    required init(order:MMenu.Order)
    {
        self.order = order
        icon = #imageLiteral(resourceName: "assetGenericMatch")
    }
    
    func selected(session:MSession) -> UIViewController
    {
        let controller:CSettings = CSettings(session:session)
        
        return controller
    }
}
