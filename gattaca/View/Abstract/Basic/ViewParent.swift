import UIKit

class ViewParent:UIView
{
    weak var panRecognizer:UIPanGestureRecognizer!
    var panningX:CGFloat?
    let kMaxXPanning:CGFloat = 60
    let kMaxXDelta:CGFloat = 210
    let kMinXDelta:CGFloat = 30
    let kAnimationDuration:TimeInterval = 0.3
    private(set) weak var controller:ControllerParent!
    
    init(controller:ControllerParent)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.white
        self.controller = controller
        
        let viewMenu:VMenu = VMenu()
        
        addSubview(viewMenu)
        
        factoryGesture()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
