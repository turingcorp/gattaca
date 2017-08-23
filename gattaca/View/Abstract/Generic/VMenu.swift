import UIKit

class VMenu:UIView
{
    private weak var controller:ControllerParent!
    
    init(controller:ControllerParent)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        return nil
    }
}
