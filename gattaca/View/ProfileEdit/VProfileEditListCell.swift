import UIKit

class VProfileEditListCell:UICollectionViewCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func config(model:MProfileEditItemProtocol, controller:CProfileEdit)
    {
        
    }
}
