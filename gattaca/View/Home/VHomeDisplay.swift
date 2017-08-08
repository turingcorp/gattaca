import UIKit

class VHomeDisplay:View<VHome, MHome, CHome>
{
    
    
    required init(controller:CHome)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
        backgroundColor = UIColor.colourBackgroundDark
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: public
    
    func refresh()
    {
        
    }
}
