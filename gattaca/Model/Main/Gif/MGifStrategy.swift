import Foundation

class MGifStrategy
{
    private(set) weak var model:MGif!
    
    init(model:MGif)
    {
        self.model = model
    }
    
    //MARK: internal
    
    func startBackgroundDownload()
    {
    }
}
