import UIKit

struct MMenuItemHome:MMenuItemProtocol
{
    let order:MMenu.Order
    let icon:UIImage = #imageLiteral(resourceName: "assetGenericGif")
    
    func controller(session:MSession) -> UIViewController
    {
        let controller:CHome = CHome(session:session)
        
        return controller
    }
}
