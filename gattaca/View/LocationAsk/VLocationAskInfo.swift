import UIKit

class VLocationAskInfo:
    View<VLocationAsk, MLocationAsk, CLocationAsk>
{
    private let kTitleHeight:CGFloat = 30
    private let kSubtitleHeight:CGFloat = 55
    
    required init(controller:CLocationAsk)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.medium(size:19)
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.textColor = UIColor.white
        labelTitle.text = String.localizedView(
            key:"VLocationAskInfo_labelTitle")
        
        let labelSubtitle:UILabel = UILabel()
        labelSubtitle.isUserInteractionEnabled = false
        labelSubtitle.translatesAutoresizingMaskIntoConstraints = false
        labelSubtitle.backgroundColor = UIColor.clear
        labelSubtitle.font = UIFont.regular(size:14)
        labelSubtitle.numberOfLines = 0
        labelSubtitle.textAlignment = NSTextAlignment.center
        labelSubtitle.textColor = UIColor(white:1, alpha:0.8)
        labelSubtitle.text = String.localizedView(
            key:"VLocationAskInfo_labelSubtitle")
        
        addSubview(labelTitle)
        addSubview(labelSubtitle)
        
        NSLayoutConstraint.bottomToBottom(
            view:labelSubtitle,
            toView:self)
        NSLayoutConstraint.height(
            view:labelSubtitle,
            constant:kSubtitleHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:labelSubtitle,
            toView:self)
        
        NSLayoutConstraint.bottomToTop(
            view:labelTitle,
            toView:labelSubtitle)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:kTitleHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:labelTitle,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
