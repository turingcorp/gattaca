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
    
    private func storeItems(
        coreData:Database,
        dispatchGroup:DispatchGroup,
        items:[MGiphyItem])
    {
        for item:MGiphyItem in items
        {
            dispatchGroup.enter()
            
            coreData.create
            { [weak self] (gif:DGif) in
                
                gif.initialValues(
                    identifier:item.identifier)
                
                self?.newItem(item:gif)
                
                dispatchGroup.leave()
            }
        }
    }
    
    //MARK: internal
    
    func storeItems(
        coreData:Database,
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
            {
                coreData.save(completion:completion)
            }
            
            storeItems(
                coreData:coreData,
                dispatchGroup:dispatchGroup,
                items:items)
        }
        else
        {
            completion()
        }
    }
}
