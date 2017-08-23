import UIKit

class VMenu:UIView
{
    var cellSize:CGSize?
    private(set) weak var controller:ControllerParent!
    
    init(controller:ControllerParent)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        factoryCollection()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
