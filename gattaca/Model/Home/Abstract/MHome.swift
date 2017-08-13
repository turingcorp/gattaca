import Foundation

class MHome:Model
{
    let urlSession:URLSession
    let actions:[MHomeActionProtocol]
    var requestOffset:Int
    private(set) var items:[MHomeItem]
    
    required init(session:MSession)
    {
        actions = MHome.factoryActions()
        urlSession = MRequest.factorySession()
        items = []
        requestOffset = 0
        
        super.init(session:session)
    }
    
    deinit
    {
        urlSession.invalidateAndCancel()
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: internal
    
    func updateItems(items:[MHomeItem])
    {/*
        self.items.append(contentsOf:items)
        delegate?.modelRefresh()
        
        MSession.sharedInstance.gif.strategy?.startBackgroundDownload()*/
    }
}
