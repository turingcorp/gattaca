import UIKit

class VProfile:ViewMain
{
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        
        guard
        
            let controller:CProfile = controller as? CProfile
        
        else
        {
            return
        }
        
        factoryViews(controller:controller)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func factoryViews(controller:CProfile)
    {
        
    }
}
