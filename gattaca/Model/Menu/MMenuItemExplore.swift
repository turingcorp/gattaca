import UIKit

class MMenuItemExplore:MMenuItemProtocol
{
    let order:MMenu.Order
    let icon:UIImage
    
    required init(order:MMenu.Order)
    {
        self.order = order
        icon = #imageLiteral(resourceName: "assetGenericExplore")
    }
    
    func selected(session:MSession) -> UIViewController
    {
        let controller:CExplore = CExplore(session:session)
        
        return controller
    }
}
