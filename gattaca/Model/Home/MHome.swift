import Foundation

class MHome:Model
{
    weak var task:URLSessionTask?
    let session:URLSession
    
    required init()
    {
        session = MHome.factorySession()
        
        super.init()
    }
    
    deinit
    {
        task?.cancel()
    }
}
