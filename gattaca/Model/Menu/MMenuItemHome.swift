import UIKit

class MMenuItemHome:MMenuItemProtocol
{
    let order:MMenu.Order
    let icon:UIImage = #imageLiteral(resourceName: "assetGenericGif")
    
    required init(order:MMenu.Order)
    {
        self.order = order
    }
    
    func selected(session:MSession) -> UIViewController
    {
        let controller:CHome = CHome(session:session)
        
        return controller
    }
}
