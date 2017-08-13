import UIKit
import AVFoundation

class VHomeDisplay:View<VHome, MHome, CHome>
{
    private weak var avPlayer:AVPlayer!
    private weak var spinner:VSpinner!
    private let kBorderHeight:CGFloat = 1
    
    required init(controller:CHome)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
        
        let border:VBorder = VBorder(
            colour:UIColor.colourBackgroundDark.withAlphaComponent(0.2))
        
        let spinner:VSpinner = VSpinner()
        self.spinner = spinner
        
        addSubview(border)
        addSubview(spinner)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:spinner,
            toView:self)
        
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
    
    deinit
    {
        spinner.stopAnimating()
        NotificationCenter.default.removeObserver(self)
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
            spinner.startAnimating()
            
            return
        }
        
        spinner.stopAnimating()
        
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
