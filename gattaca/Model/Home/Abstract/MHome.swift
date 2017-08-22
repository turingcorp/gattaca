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
    
    private func addItems(items:[MHomeItem])
    {
        let countPreviousItems:Int = self.items.count
        
        itemsQueue.async
        { [weak self] in
            
            self?.items.append(contentsOf:items)
            
            if countPreviousItems == 0
            {
                self?.view?.refresh()
            }
        }
    }
    
    //MARK: internal
    
    func loadItems()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoadItems
            { [weak self] (items:[MHomeItem]) in
                
                self?.addItems(items:items)
            }
        }
    }
}
