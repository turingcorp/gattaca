import Foundation

class MGifStrategyNotLoaded:MGifStrategy
{
    override func load(
        coreData:Database,
        completion:@escaping(() -> ()))
    {
        model.load(coreData:coreData, completion:completion)
    }
}
