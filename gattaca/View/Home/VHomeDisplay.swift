import UIKit
import AVFoundation

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
    
    override static var layerClass:AnyClass
    {
        return AVPlayerLayer.self
    }
    
    //MARK: private
    
    //MARK: public
    
    func refresh()
    {
        
    }
}
