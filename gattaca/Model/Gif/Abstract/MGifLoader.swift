import Foundation
import CoreData

extension MGif
{
    //MARK: private
    
    private func loadCompleteGroup(item:DGif)
    {
        switch item.status
        {
        case DGif.Status.new:
            
            itemsNotReady.append(item)
            
            break
            
        case DGif.Status.ready:
            
            itemsReady.append(item)
            
            break
            
        default:
            break
        }
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
            
            self?.loadComplete(
                gifs:gifs,
                completion:completion)
        }
    }
    
    func loadComplete(
        gifs:[DGif],
        completion:@escaping(() -> ()))
    {
        for item:DGif in gifs
        {
            mapItem(item:item)
            loadCompleteGroup(item:item)
        }
        
        loadCompleteDone(completion:completion)
    }
    
    func loadCompleteDone(
        completion:(() -> ()))
    {
        MGif.createDirectory()
        strategyStand()
        completion()
    }
}
