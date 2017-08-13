import Foundation
import CoreData

extension MGif
{
    //MARK: private
    
    private class func factoryDispatchGroup() -> DispatchGroup
    {
        let dispatchGroup:DispatchGroup = DispatchGroup()
        dispatchGroup.setTarget(
            queue:DispatchQueue.global(
                qos:DispatchQoS.QoSClass.background))
        
        return dispatchGroup
    }
    
    private func storeFinished(completion:@escaping(() -> ()))
    {
//        DManager.sharedInstance?.save
//        {
//            completion()
//        }
    }
    
    private func storeItems(
        dispatchGroup:DispatchGroup,
        items:[MGiphyItem])
    {
        for item:MGiphyItem in items
        {
            dispatchGroup.enter()
            
            storeItem(
                dispatchGroup:dispatchGroup,
                item:item)
        }
    }
    
    private func storeItem(
        dispatchGroup:DispatchGroup,
        item:MGiphyItem)
    {/*
        DManager.sharedInstance?.create(entity:DGif.self)
        { (data:NSManagedObject?) in
            
            guard
            
                let gif:DGif = data as? DGif
            
            else
            {
                return
            }
            
            gif.newGif(identifier:item.identifier)
            MSession.sharedInstance.gif.addItem(item:gif)
            
            dispatchGroup.leave()
        }*/
    }
    
    //MARK: internal
    
    func storeItems(
        items:[MGiphyItem],
        completion:@escaping(() -> ()))
    {
        let countItems:Int = items.count
        
        if countItems > 0
        {
            let dispatchGroup:DispatchGroup = MGif.factoryDispatchGroup()
            dispatchGroup.notify(
                queue:
                DispatchQueue.global(qos:DispatchQoS.QoSClass.background))
            { [weak self] in
                
                self?.storeFinished(completion:completion)
            }
            
            storeItems(
                dispatchGroup:dispatchGroup,
                items:items)
        }
        else
        {
            completion()
        }
    }
}
