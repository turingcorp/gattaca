import Foundation
import CoreData

extension MSession
{
    func loadGifs()
    {
        DManager.sharedInstance?.fetch(entity:DGif.self)
        { [weak self] (data:[NSManagedObject]?) in
            
            guard
                
                let gifs:[DGif] = data as? [DGif]
                
            else
            {
                return
            }
            
            self?.gifsLoaded(gifs:gifs)
        }
    }
    
    //MARK: private
    
    private func gifsLoaded(gifs:[DGif])
    {
        let sorted:[DGif] = gifs.sorted
        { (gifA:DGif, gifB:DGif) -> Bool in
            
            return gifA.created < gifB.created
        }
        
        gif.itemsLoaded(items:sorted)
        
        DGif.createDirectory()
        finishedLoadingSession()
    }
}
