import UIKit

class VHome:ViewMain
{
    private weak var viewDisplay:VHomeDisplay!
    private weak var layoutDisplayHeight:NSLayoutConstraint!
    private let kBarHeight:CGFloat = 70
    
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
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.width
        layoutDisplayHeight.constant = width
        
        super.layoutSubviews()
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
        layoutDisplayHeight = NSLayoutConstraint.height(
            view:viewDisplay)
        NSLayoutConstraint.equalsHorizontal(
            view:viewDisplay,
            toView:self)
    }
    
    //MARK: internal
    
    func refresh()
    {
        viewDisplay.refresh()
    }
}
