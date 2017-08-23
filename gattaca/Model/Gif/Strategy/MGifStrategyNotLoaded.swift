import Foundation

class MGifStrategyNotLoaded:MGifStrategy
{
    override func load(
        coreData:Database,
        completion:@escaping(() -> ()))
    {
        super.load(
            coreData:coreData,
            completion:completion)
        
        model.load(coreData:coreData, completion:completion)
    }
}
