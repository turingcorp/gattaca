import Foundation

class MHome:Model
{
    weak var sessionTask:URLSessionTask?
    let session:URLSession
    private(set) var items:[MHomeItem]
    
    required init()
    {
        session = MRequest.factorySession()
        items = []
        
        super.init()
    }
    
    deinit
    {
        sessionTask?.cancel()
    }
    
    //MARK: internal
    
    func addItem(item:MHomeItem)
    {
        items.append(item)
        delegate?.modelRefresh()
    }
}
