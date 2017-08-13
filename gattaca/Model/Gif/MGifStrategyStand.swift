import Foundation

class MGifStrategyStand:MGifStrategy
{
    override func startBackgroundDownload()
    {
        model.strategyDownload()
    }
}
