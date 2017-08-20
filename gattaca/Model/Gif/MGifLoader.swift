import Foundation
import CoreData

extension MGif
{
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
            loadCompleteMap(item:item)
            loadCompleteGroup(item:item)
        }
        
        loadCompleteDone(completion:completion)
    }
    
    func loadCompleteMap(item:DGif)
    {
        guard
            
            let identifier:String = item.identifier
            
        else
        {
            return
        }
        
        map[identifier] = item
    }
    
    func loadCompleteGroup(item:DGif)
    {
        switch item.status
        {
        case DGif.Status.new,
             DGif.Status.loading:
            
            itemsNotReady.append(item)
            
            break
            
        case DGif.Status.ready:
            
            itemsReady.append(item)
            
            break
            
        default:
            break
        }
    }
    
    func loadCompleteDone(
        completion:(() -> ()))
    {
        DGif.createDirectory()
        strategyStand()
        completion()
    }
}
