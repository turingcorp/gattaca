import UIKit

class VProfileEdit:ViewMain
{
    private let kBarHeight:CGFloat = 64
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        
        guard
        
            let controller:CProfileEdit = controller as? CProfileEdit
        
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
    
    private func factoryViews(controller:CProfileEdit)
    {
        
    }
}
