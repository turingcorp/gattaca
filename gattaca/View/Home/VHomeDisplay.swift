import UIKit

class VHomeDisplay:View<VHome, MHome, CHome>
{
    required init(controller:CHome)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.colourBackgroundDark
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
