import UIKit
import AVFoundation

class VHomeDisplay:View<VHome, MHome, CHome>
{
    private weak var avPlayer:AVPlayer!
    
    required init(controller:CHome)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
        backgroundColor = UIColor.black
        
        guard
            
            let layer:AVPlayerLayer = self.layer as? AVPlayerLayer
            
        else
        {
            return
        }
        
        let avPlayer:AVPlayer = AVPlayer(playerItem:nil)
        self.avPlayer = avPlayer
        
        layer.player = avPlayer
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
    
    private func updatePlayer()
    {
        guard
            
            let item:MHomeItem = controller.model.items.first
            
        else
        {
            return
        }
        
        let avPlayerItem:AVPlayerItem = AVPlayerItem(url:item.url)
        
        avPlayer.replaceCurrentItem(with:avPlayerItem)
        avPlayer.play()
    }
    
    //MARK: public
    
    func refresh()
    {
        updatePlayer()
    }
}
