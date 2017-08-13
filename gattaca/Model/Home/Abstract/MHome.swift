import Foundation

class MHome:Model
{
    var strategy:MHomeStrategy?
    var requestOffset:Int
    let urlSession:URLSession
    let actions:[MHomeActionProtocol]
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
