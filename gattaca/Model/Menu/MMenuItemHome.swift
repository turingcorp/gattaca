import UIKit

class MMenuItemHome:MMenuItemProtocol
{
    let order:MMenu.Order
    let icon:UIImage
    
    required init(order:MMenu.Order)
    {
        self.order = order
        icon = #imageLiteral(resourceName: "assetGenericGif")
    }
    
    func selected(session:MSession) -> UIViewController
    {
        let controller:CHome = CHome(session:session)
        
        return controller
    }
}
