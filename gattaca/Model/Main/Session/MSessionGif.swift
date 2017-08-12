import Foundation
import CoreData

extension MSession
{
    //MARK: private
    
    private func gifsLoaded(
        gifs:[DGif],
        completion:@escaping(() -> ()))
    {
        DGif.createDirectory()
        
        let sorted:[DGif] = sortGis(gifs:gifs)
        gif.itemsLoaded(items:sorted)
        
        completion()
    }
    
    private func sortGis(gifs:[DGif]) -> [DGif]
    {
        let sorted:[DGif] = gifs.sorted
        { (gifA:DGif, gifB:DGif) -> Bool in
            
            return gifA.created < gifB.created
        }
        
        return sorted
    }
    
    //MARK: internal
    
    func loadGifs(completion:@escaping(() -> ()))
    {
        DManager.sharedInstance?.fetch(entity:DGif.self)
        { [weak self] (data:[NSManagedObject]?) in
            
            guard
                
                let gifs:[DGif] = data as? [DGif]
                
            else
            {
                completion()
                return
            }
            
            self?.gifsLoaded(
                gifs:gifs,
                completion:completion)
        }
    }
}
