import Foundation

class MGifStrategy
{
    private(set) weak var model:MGif!
    
    init?(model:MGif)
    {
        self.model = model
    }
    
    //MARK: internal
    
    func load(
        coreData:Database,
        completion:@escaping(() -> ()))
    {
    }
    
    func download()
    {
    }
}
