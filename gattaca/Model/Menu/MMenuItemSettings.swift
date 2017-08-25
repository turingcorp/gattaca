import UIKit

class MMenuItemSettings:MMenuItemProtocol
{
    let order:MMenu.Order
    let icon:UIImage = #imageLiteral(resourceName: "assetGenericSettings")
    
    required init(order:MMenu.Order)
    {
        self.order = order
    }
    
    func selected(session:MSession) -> UIViewController
    {
        let controller:CSettings = CSettings(session:session)
        
        return controller
    }
}
