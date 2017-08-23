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
    private let kMenuHeight:CGFloat = 80
    
    init(controller:ControllerParent)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.white
        self.controller = controller
        
        let viewMenu:VMenu = VMenu(controller:controller)
        
        addSubview(viewMenu)
        
        NSLayoutConstraint.bottomToBottom(
            view:viewMenu,
            toView:self)
        NSLayoutConstraint.height(
            view:viewMenu,
            constant:kMenuHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewMenu,
            toView:self)
        
        factoryGesture()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
