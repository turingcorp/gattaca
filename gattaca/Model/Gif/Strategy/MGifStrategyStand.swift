import Foundation

class MGifStrategyStand:MGifStrategy
{
    override func load(
        coreData:Database,
        completion:@escaping (() -> ()))
    {
        super.load(
            coreData:coreData,
            completion:completion)
        
        completion()
    }
    
    override func download()
    {
        super.download()
        
        model.strategyDownload()
    }
}
