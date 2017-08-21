import Foundation

class MHome:Model
{
    var coreData:Database?
    var strategy:MHomeStrategy?
    var status:MHome.Status
    var requestOffset:Int
    let gif:MGif
    let urlSession:URLSession
    let actions:[MHomeActionProtocol]
    private(set) var items:[MHomeItem]
    
    required init(session:MSession)
    {
        gif = MGif()
        actions = MHome.factoryActions()
        urlSession = MRequest.factorySession()
        items = []
        status = MHome.Status.new
        requestOffset = 0
        
        super.init(session:session)
    }
    
    deinit
    {
        urlSession.invalidateAndCancel()
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: internal
    
    func loadItems()
    {
        asyncLoadItems
        { [weak self] (items:[MHomeItem]) in
            
            self?.items = items
        }
    }
    
    func updateItems(items:[MHomeItem])
    {/*
        self.items.append(contentsOf:items)
        delegate?.modelRefresh()
        
        MSession.sharedInstance.gif.strategy?.startBackgroundDownload()*/
    }
}
