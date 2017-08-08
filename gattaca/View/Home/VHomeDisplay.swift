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
        
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(notifiedPlayedToEnd(sender:)),
            name:Notification.Name.AVPlayerItemDidPlayToEndTime,
            object:nil)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override static var layerClass:AnyClass
    {
        return AVPlayerLayer.self
    }
    
    //MARK: notifications
    
    func notifiedPlayedToEnd(sender notification:Notification)
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.restartPlayer()
        }
    }
    
    //MARK: private
    
    private func restartPlayer()
    {
        avPlayer.seek(to:kCMTimeZero)
        avPlayer.play()
    }
    
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
    
    func viewDidAppear()
    {
        restartPlayer()
    }
    
    func refresh()
    {
        updatePlayer()
    }
}
