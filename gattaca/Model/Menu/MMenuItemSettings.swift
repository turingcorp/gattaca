import UIKit

struct MMenuItemSettings:MMenuItemProtocol
{
    let order:MMenu.Order
    let icon:UIImage = #imageLiteral(resourceName: "assetGenericSettings")
    
    func controller(session:MSession) -> UIViewController
    {
        let controller:CHome = CHome(session:session)
        
        return controller
    }
}
