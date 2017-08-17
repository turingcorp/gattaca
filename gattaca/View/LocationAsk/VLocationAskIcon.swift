import UIKit

class VLocationAskIcon:
    View<VLocationAsk, MLocationAsk, CLocationAsk>
{
    required init(controller:CLocationAsk)
    {
        super.init(controller:controller)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
