import UIKit

class VProfile:ViewMain
{
    private weak var viewCard:VProfileCard!
    private weak var layoutCardHeight:NSLayoutConstraint!
    private let kCardExtraHeight:CGFloat = 80
    
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
        let viewCard:VProfileCard = VProfileCard(
            controller:controller)
        self.viewCard = viewCard
        
        addSubview(viewCard)
        
        NSLayoutConstraint.topToTop(
            view:viewCard,
            toView:self)
        layoutCardHeight = NSLayoutConstraint.height(
            view:viewCard)
        NSLayoutConstraint.equalsHorizontal(
            view:viewCard,
            toView:self)
    }
}
