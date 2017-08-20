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
        DGif.createDirectory()
        
        for item:DGif in gifs
        {
            loadMap(item:item)
            loadGroup(item:item)
        }
        
        strategyStand()
        completion()
    }
    
    func loadMap(item:DGif)
    {
        guard
            
            let identifier:String = item.identifier
            
        else
        {
            return
        }
        
        map[identifier] = item
    }
    
    func loadGroup(item:DGif)
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
}
