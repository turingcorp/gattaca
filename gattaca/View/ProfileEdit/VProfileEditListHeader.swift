import UIKit

class VProfileEditListHeader:UICollectionReusableView
{
    private weak var labelTitle:UILabel!
    private let kTitleHeight:CGFloat = 30
    private let kTitleMarginLeft:CGFloat = 10
    private let kTitleWidth:CGFloat = 200
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let labelTitle:UILabel = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.isUserInteractionEnabled = false
        labelTitle.font = UIFont.medium(size:15)
        labelTitle.textColor = UIColor.colourBackgroundDark
        self.labelTitle = labelTitle
        
        NSLayoutConstraint.bottomToTop(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:kTitleHeight)
        NSLayoutConstraint.leftToLeft(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.width(
            view:labelTitle,
            constant:kTitleWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func config(model:MProfileEditItemProtocol)
    {
        labelTitle.text = model.headerTitle
    }
}
