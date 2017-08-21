import UIKit

class VHomeError:View<VHome, MHome, CHome>
{
    private weak var labelMessage:UILabel!
    private weak var layoutButtonLeft:NSLayoutConstraint!
    private let kMessageTop:CGFloat = 20
    private let kMessageMarginHorizontal:CGFloat = 20
    private let kMessageHeight:CGFloat = 100
    private let kButtonWidth:CGFloat = 130
    private let kButtonHeight:CGFloat = 32
    
    required init(controller:CHome)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.white
        isHidden = true
        
        let labelMessage:UILabel = UILabel()
        labelMessage.isUserInteractionEnabled = false
        labelMessage.translatesAutoresizingMaskIntoConstraints = false
        labelMessage.backgroundColor = UIColor.clear
        labelMessage.numberOfLines = 0
        labelMessage.textAlignment = NSTextAlignment.center
        labelMessage.font = UIFont.regular(size:17)
        labelMessage.textColor = UIColor.colourBackgroundDark
        self.labelMessage = labelMessage
        
        let button:UIButton = UIButton()
        button.clipsToBounds = true
        button.backgroundColor = UIColor.colourSuccess
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(
            String.localizedView(key:"VHomeError_button"),
            for:UIControlState.normal)
        button.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        button.setTitleColor(
            UIColor(white:1, alpha:0.2),
            for:UIControlState.highlighted)
        button.titleLabel!.font = UIFont.medium(size:14)
        button.layer.cornerRadius = kButtonHeight / 2.0
        button.addTarget(
            self,
            action:#selector(selectorTryAgain(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(labelMessage)
        addSubview(button)
        
        NSLayoutConstraint.topToTop(
            view:labelMessage,
            toView:self,
            constant:kMessageTop)
        NSLayoutConstraint.height(
            view:labelMessage,
            constant:kMessageHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:labelMessage,
            toView:self,
            margin:kMessageMarginHorizontal)
     
        NSLayoutConstraint.topToBottom(
            view:button,
            toView:labelMessage)
        NSLayoutConstraint.height(
            view:button,
            constant:kButtonHeight)
        NSLayoutConstraint.width(
            view:button,
            constant:kButtonWidth)
        layoutButtonLeft = NSLayoutConstraint.leftToLeft(
            view:button,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.width
        let remainWidth:CGFloat = width - kButtonWidth
        let marginLeft:CGFloat = remainWidth / 2.0
        layoutButtonLeft.constant = marginLeft
        
        super.layoutSubviews()
    }
    
    //MARK: selectors
    
    func selectorTryAgain(sender button:UIButton)
    {
        isHidden = true
        controller?.model.loadItems()
    }
    
    //MARK: private
    
    private func asyncShowError(message:String)
    {
        isHidden = false
        labelMessage.text = message
    }
    
    //MARK: internal
    
    func showError(message:String)
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.asyncShowError(message:message)
        }
    }
}
