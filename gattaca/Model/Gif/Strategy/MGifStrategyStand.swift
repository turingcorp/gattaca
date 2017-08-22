import Foundation

class MGifStrategyStand:MGifStrategy
{
    override func load(
        coreData:Database,
        completion:@escaping (() -> ()))
    {
        completion()
    }
    
    override func download()
    {
        model.strategyDownload()
    }
}
