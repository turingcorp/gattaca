import UIKit
import GifHero

class VHomeDisplay:View<VHome, MHome, CHome>
{
    required init(controller:CHome)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
        backgroundColor = UIColor.black
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    //MARK: public
    
    func refresh()
    {
        
    }
}
