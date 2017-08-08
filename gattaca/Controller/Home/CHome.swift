import UIKit

class CHome:Controller<VHome, MHome>
{
    override var preferredStatusBarStyle:UIStatusBarStyle
    {
        get
        {
            return UIStatusBarStyle.lightContent
        }
    }
    
    override var prefersStatusBarHidden:Bool
    {
        get
        {
            return true
        }
    }
    
    override func modelRefresh()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.dispatchRefresh()
        }
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        view().viewDidAppear()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        model.requestRandomGif()
    }
    
    //MARK: private
    
    private func dispatchRefresh()
    {
        view().refresh()
    }
}
