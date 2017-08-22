import Foundation

class MGif
{
    var itemsReady:[DGif]
    var itemsNotReady:[DGif]
    var map:[String:DGif]
    private(set) var strategy:MGifStrategy?
    
    init()
    {
        itemsReady = []
        itemsNotReady = []
        map = [:]
        
        strategyNotLoaded()
    }
    
    //MARK: internal
    
    func strategyNotLoaded()
    {
        strategy = MGifStrategyNotLoaded(model:self)
    }
    
    func strategyStand()
    {
        strategy = MGifStrategyStand(model:self)
    }
    
    func strategyDownload()
    {
        strategy = MGifStrategyDownload(model:self)
    }
}
