import UIKit

class VHome:ViewMain
{
    private weak var viewDisplay:VHomeDisplay!
    private let kBarHeight:CGFloat = 70
    private let kDisplayBottom:CGFloat = -160
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        
        guard
        
            let controller:CHome = controller as? CHome
        
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
    
    private func factoryViews(controller:CHome)
    {
        let viewDisplay:VHomeDisplay = VHomeDisplay(
            controller:controller)
        self.viewDisplay = viewDisplay
        
        let viewBar:VHomeBar = VHomeBar(
            controller:controller)
        
        addSubview(viewBar)
        addSubview(viewDisplay)
        
        NSLayoutConstraint.bottomToBottom(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:kBarHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:viewDisplay,
            toView:self)
        NSLayoutConstraint.bottomToBottom(
            view:viewDisplay,
            toView:self,
            constant:kDisplayBottom)
        NSLayoutConstraint.equalsHorizontal(
            view:viewDisplay,
            toView:self)
    }
    
    //MARK: internal
    
    func viewDidAppear()
    {
        viewDisplay.viewDidAppear()
    }
    
    func refresh()
    {
        viewDisplay.refresh()
    }
}
