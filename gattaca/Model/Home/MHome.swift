import Foundation

class MHome:Model
{
    weak var sessionTask:URLSessionTask?
    let session:URLSession
    let actions:[MHomeActionProtocol]
    private(set) var items:[MHomeItem]
    
    required init()
    {
        actions = MHome.factoryActions()
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
