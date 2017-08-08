import UIKit
import GifHero

class VHomeDisplay:View<VHome, MHome, CHome>
{
    private weak var viewGif:GifView?
    
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
    
    private func factoryGif()
    {
        guard
            
            let item:MHomeItem = controller.model.items.first
        
        else
        {
            return
        }
        
        let url:URL = item.url
        
        let viewGif:GifView = GifView()
        viewGif.url = url
        viewGif.animating = true
        self.viewGif = viewGif
        
        addSubview(viewGif)
        
        NSLayoutConstraint.equals(
            view:viewGif,
            toView:self)
    }
    
    //MARK: public
    
    func refresh()
    {
        viewGif?.removeFromSuperview()
        factoryGif()
    }
}
