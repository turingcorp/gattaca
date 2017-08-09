import UIKit

class VHome:ViewMain
{
    private weak var viewSpinner:VSpinner?
    private weak var viewBar:VHomeBar!
    private weak var viewDisplay:VHomeDisplay!
    private weak var viewActions:VHomeActions!
    private let kBarHeight:CGFloat = 70
    private let kDisplayBottom:CGFloat = -140
    private let kActionsHeight:CGFloat = 70
    
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
    
    deinit
    {
        viewSpinner?.stopAnimating()
    }
    
    //MARK: private
    
    private func factoryViews(controller:CHome)
    {
        let actionsHeight_2:CGFloat = kActionsHeight / 2.0
        
        let viewSpinner:VSpinner = VSpinner()
        self.viewSpinner = viewSpinner
        
        let viewDisplay:VHomeDisplay = VHomeDisplay(
            controller:controller)
        self.viewDisplay = viewDisplay
        
        let viewBar:VHomeBar = VHomeBar(
            controller:controller)
        self.viewBar = viewBar
        
        let viewActions:VHomeActions = VHomeActions(
            controller:controller)
        self.viewActions = viewActions
        
        addSubview(viewSpinner)
        addSubview(viewBar)
        addSubview(viewDisplay)
        addSubview(viewActions)
        
        NSLayoutConstraint.equals(
            view:viewSpinner,
            toView:self)
        
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
        
        NSLayoutConstraint.topToBottom(
            view:viewActions,
            toView:viewDisplay,
            constant:-actionsHeight_2)
        NSLayoutConstraint.height(
            view:viewActions,
            constant:kActionsHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewActions,
            toView:self)
    }
    
    private func firstRefresh()
    {
        viewDisplay.isHidden = false
        viewActions.isHidden = false
        viewBar.isHidden = false
        
        update()
    }
    
    private func update()
    {
        viewDisplay.refresh()
    }
    
    //MARK: internal
    
    func viewDidAppear()
    {
        viewDisplay.viewDidAppear()
    }
    
    func refresh()
    {
        guard
            
            let viewSpinner:VSpinner = self.viewSpinner
        
        else
        {
            update()
            
            return
        }
        
        viewSpinner.stopAnimating()
        viewSpinner.removeFromSuperview()
        
        firstRefresh()
    }
}
