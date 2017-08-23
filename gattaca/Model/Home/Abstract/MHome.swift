import Foundation

class MHome:Model<VHome>
{
    var coreData:Database?
    var strategy:MHomeStrategy?
    var status:MHome.Status
    var requestOffset:Int
    let gif:MGif
    let urlSession:URLSession
    let actions:[MHomeActionProtocol]
    private(set) var items:[MHomeItem]
    private let itemsQueue:DispatchQueue
    
    required init(session:MSession)
    {
        gif = MGif()
        actions = MHome.factoryActions()
        urlSession = MRequest.factorySession()
        items = []
        status = MHome.Status.new
        requestOffset = 0
        itemsQueue = MHome.factoryQueue()
        
        super.init(session:session)
        
        gif.model = self
    }
    
    deinit
    {
        urlSession.invalidateAndCancel()
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: private
    
    private func loadedItems(items:[MHomeItem])
    {
        let countPreviousItems:Int = self.items.count
        
        addItems(items:items)
        { [weak self] in
            
            if countPreviousItems == 0
            {
                self?.view?.refresh()
            }
            
            self?.checkCurrentItems()
        }
    }
    
    private func addItems(
        items:[MHomeItem],
        completion:@escaping(() -> ()))
    {
        itemsQueue.async
        { [weak self] in
            
            self?.items.append(contentsOf:items)
            completion()
        }
    }
    
    private func checkCurrentItems()
    {
        let count:Int = items.count
        
        if count > 0
        {
            gif.strategy?.download()
        }
        else
        {
            requestGifs()
        }
    }
    
    //MARK: internal
    
    func loadItems()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoadItems
            { [weak self] (items:[MHomeItem]) in
                
                self?.loadedItems(items:items)
            }
        }
    }
    
    func removeFirst(gif:DGif)
    {
        guard
            
            let item:MHomeItem = items.first
            
        else
        {
            return
        }
        
        if item.gif === gif
        {
            items.removeFirst()
        }
    }
}
