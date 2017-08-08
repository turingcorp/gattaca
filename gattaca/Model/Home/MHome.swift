import Foundation

class MHome:Model
{
    weak var task:URLSessionTask?
    let session:URLSession
    
    required init()
    {
        session = MRequest.factorySession()
        
        super.init()
    }
    
    deinit
    {
        task?.cancel()
    }
}
