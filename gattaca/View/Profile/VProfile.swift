import UIKit

class VProfile:ViewMain
{
    private weak var viewCard:VProfileCard!
    private weak var layoutCardHeight:NSLayoutConstraint!
    private let kCardExtraHeight:CGFloat = 80
    private let kButtonHeight:CGFloat = 70
    
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
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.width
        let cardHeight:CGFloat = width + kCardExtraHeight
        layoutCardHeight.constant = cardHeight
        
        super.layoutSubviews()
    }
    
    //MARK: private
    
    private func factoryViews(controller:CProfile)
    {
        let editHeight_2:CGFloat = kButtonHeight / 2.0
        
        let viewCard:VProfileCard = VProfileCard(
            controller:controller)
        self.viewCard = viewCard
        
        let viewButton:VProfileButton = VProfileButton(
            controller:controller)
        
        addSubview(viewCard)
        addSubview(viewButton)
        
        NSLayoutConstraint.topToTop(
            view:viewCard,
            toView:self)
        layoutCardHeight = NSLayoutConstraint.height(
            view:viewCard)
        NSLayoutConstraint.equalsHorizontal(
            view:viewCard,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:viewButton,
            toView:viewCard,
            constant:-editHeight_2)
        NSLayoutConstraint.height(
            view:viewButton,
            constant:kButtonHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewButton,
            toView:self)
    }
}
