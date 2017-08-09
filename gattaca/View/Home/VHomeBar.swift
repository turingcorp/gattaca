import UIKit

class VHomeBar:View<VHome, MHome, CHome>
{
    required init(controller:CHome)
    {
        super.init(controller:controller)
        isHidden = true
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
