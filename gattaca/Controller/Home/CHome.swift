import UIKit

class CHome:Controller<VHome, MHome>
{
    override func modelRefresh()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.dispatchRefresh()
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        model.requestRandomGif()
    }
    
    //MARK: private
    
    private func dispatchRefresh()
    {
        guard
        
            let view:VHome = self.view as? VHome
        
        else
        {
            return
        }
        
        view.refresh()
    }
}
