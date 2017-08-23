import UIKit

class VHome:ViewMain
{
    private weak var viewBar:VHomeBar!
    private weak var viewDisplay:VHomeDisplay!
    private weak var viewError:VHomeError!
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
    
    //MARK: private
    
    private func factoryViews(controller:CHome)
    {
        let actionsHeight_2:CGFloat = kActionsHeight / 2.0
        
        let viewDisplay:VHomeDisplay = VHomeDisplay(
            controller:controller)
        self.viewDisplay = viewDisplay
        
        let viewBar:VHomeBar = VHomeBar(
            controller:controller)
        self.viewBar = viewBar
        
        let viewActions:VHomeActions = VHomeActions(
            controller:controller)
        self.viewActions = viewActions
        
        let viewError:VHomeError = VHomeError(
            controller:controller)
        self.viewError = viewError

        addSubview(viewBar)
        addSubview(viewDisplay)
        addSubview(viewError)
        addSubview(viewActions)
        
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
        
        NSLayoutConstraint.equals(
            view:viewError,
            toView:viewDisplay)
    }
    
    private func asyncRefresh()
    {
        viewError.isHidden = true
        viewDisplay.isHidden = false
        viewBar.isHidden = false
        viewActions.refresh()
        viewDisplay.refresh()
    }
    
    //MARK: internal
    
    func viewDidAppear()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.viewDisplay.viewDidAppear()
        }
    }
    
    func refresh()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.asyncRefresh()
        }
    }
    
    func loadError(message:String)
    {
        viewError.showError(message:message)
    }
    
    func markingDone(action:MHomeActionProtocol)
    {
        DispatchQueue.main.async
        { [weak self] in
            
            
        }
    }
}
