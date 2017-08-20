import Foundation
import CoreData

extension MGif
{
    private func gifsLoaded(
        gifs:[DGif],
        completion:@escaping(() -> ()))
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
    
    //MARK: internal
    
    func load(
        coreData:Database,
        completion:@escaping(() -> ()))
    {
        coreData.fetch
        { [weak self] (gifs:[DGif]) in
            
            self?.gifsLoaded(
                gifs:gifs,
                completion:completion)
        }
    }
}
