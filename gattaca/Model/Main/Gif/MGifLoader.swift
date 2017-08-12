import Foundation
import CoreData

extension MGif
{
    private func gifsLoaded(
        gifs:[DGif],
        completion:@escaping(([DGif]) -> ()))
    {
        DGif.createDirectory()
        
        let sorted:[DGif] = sortGifs(gifs:gifs)
        completion(sorted)
    }
    
    private func sortGifs(gifs:[DGif]) -> [DGif]
    {
        let sorted:[DGif] = gifs.sorted
        { (gifA:DGif, gifB:DGif) -> Bool in
            
            return gifA.created < gifB.created
        }
        
        return sorted
    }
    
    private func asyncLoadGifs(completion:@escaping(([DGif]) -> ()))
    {
        DManager.sharedInstance?.fetch(entity:DGif.self)
        { [weak self] (data:[NSManagedObject]?) in
            
            guard
                
                let gifs:[DGif] = data as? [DGif]
                
            else
            {
                completion([])
                return
            }
            
            self?.gifsLoaded(
                gifs:gifs,
                completion:completion)
        }
    }
    
    //MARK: internal
    
    func loadGifs(completion:@escaping(([DGif]) -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoadGifs(completion:completion)
        }
    }
}
