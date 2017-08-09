import Foundation

class MGifStrategyDownload:MGifStrategy
{
    override init(model:MGif)
    {
        super.init(model:model)
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.dispatchDownload()
        }
    }
    
    //MARK: private
    
    private func dispatchDownload()
    {
        
    }
}
