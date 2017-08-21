import UIKit

class VHomeError:View<VHome, MHome, CHome>
{
    private weak var labelMessage:UILabel!
    private weak var layoutButtonLeft:NSLayoutConstraint!
    private let kMessageMargin:CGFloat = 20
    private let kButtonWidth:CGFloat = 120
    private let kButtonHeight:CGFloat = 50
    private let kButtonBottom:CGFloat = -100
    
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
        labelMessage.font = UIFont.regular(size:16)
        labelMessage.textColor = UIColor.colourBackgroundDark
        self.labelMessage = labelMessage
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(
            String.localizedView(key:"VHomeError_button"),
            for:UIControlState.normal)
        button.setTitleColor(
            UIColor.colourSuccess,
            for:UIControlState.normal)
        button.setTitleColor(
            UIColor.colourSuccess.withAlphaComponent(0.2),
            for:UIControlState.highlighted)
        button.titleLabel!.font = UIFont.medium(size:15)
        button.addTarget(
            self,
            action:#selector(selectorTryAgain(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(labelMessage)
        addSubview(button)
        
        NSLayoutConstraint.equalsVertical(
            view:labelMessage,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:labelMessage,
            toView:self,
            margin:kMessageMargin)
     
        NSLayoutConstraint.bottomToBottom(
            view:button,
            toView:self,
            constant:kButtonBottom)
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
