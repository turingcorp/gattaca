import UIKit

class VProfileCard:View<VProfile, MProfile, CProfile>
{
    required init(controller:CProfile)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.colourSuccess
        isUserInteractionEnabled = false
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
