import UIKit

struct MMenuItemMatch:MMenuItemProtocol
{
    let order:MMenu.Order
    let icon:UIImage = #imageLiteral(resourceName: "assetGenericMatch")
    
    func controller(session:MSession) -> UIViewController
    {
        let controller:CHome = CHome(session:session)
        
        return controller
    }
}
