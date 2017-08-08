import UIKit
import AVFoundation

class VHomeDisplay:View<VHome, MHome, CHome>
{
    private var avPlayer:AVPlayer?
    
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
    
    private func factoryPlayer()
    {
        guard
            
            let layer:AVPlayerLayer = self.layer as? AVPlayerLayer,
            let item:MHomeItem = controller.model.items.first
            
        else
        {
            return
        }
        
        let avPlayer:AVPlayer = AVPlayer(url:item.url)
        self.avPlayer = avPlayer
        
        layer.player = avPlayer
        avPlayer.play()
        
        print(avPlayer.currentItem)
    }
    
    //MARK: public
    
    func refresh()
    {
        factoryPlayer()
    }
}
