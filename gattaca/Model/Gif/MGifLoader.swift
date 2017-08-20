import Foundation
import CoreData

extension MGif
{
    private func gifsLoaded(
        gifs:[DGif],
        completion:@escaping(() -> ()))
    {
        DGif.createDirectory()
        
        
    }
    
    //MARK: internal
    
    func load(
        coreData:Database,
        completion:@escaping(() -> ()))
    {
        coreData.fetch
        { [weak self] (data:[DGif]) in
            
            let gifs:[DGif] = data.sorted
            { (gifA:DGif, gifB:DGif) -> Bool in
                
                return gifA.created < gifB.created
            }
            
            self?.gifsLoaded(
                gifs:gifs,
                completion:completion)
        }
    }
}
