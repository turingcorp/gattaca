import UIKit

class CHome:Controller<VHome, MHome>
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        model.requestRandomGif()
    }
}
