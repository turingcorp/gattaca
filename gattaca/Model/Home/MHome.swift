import Foundation

class MHome:Model
{
    weak var sessionTask:URLSessionTask?
    let session:URLSession
    
    required init()
    {
        session = MRequest.factorySession()
        
        super.init()
    }
    
    deinit
    {
        sessionTask?.cancel()
    }
}
