import Foundation

class MHome:Model
{
    weak var sessionTask:URLSessionTask?
    let session:URLSession
    let actions:[MHomeActionProtocol]
    var requestOffset:Int
    private(set) var items:[MHomeItem]
    
    required init()
    {
        actions = MHome.factoryActions()
        session = MRequest.factorySession()
        items = []
        requestOffset = 0
        
        super.init()
    }
    
    deinit
    {
        sessionTask?.cancel()
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: internal
    
    func updateItems(items:[MHomeItem])
    {
        self.items.append(contentsOf:items)
        delegate?.modelRefresh()
        
        MSession.sharedInstance.gif.strategy?.startBackgroundDownload()
    }
}
