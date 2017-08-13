import Foundation
import CoreData

class DManager
{
    private let managedObjectContext:NSManagedObjectContext
    
    init?()
    {
        guard
        
            let managedObjectContext:NSManagedObjectContext = DManager.factoryManagedObjectContext()
        
        else
        {
            return nil
        }
        
        self.managedObjectContext = managedObjectContext
    }
    
    //MARK: internal
    
    func save(completion:(() -> ())? = nil)
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        {
            if self.managedObjectContext.hasChanges
            {
                self.managedObjectContext.perform
                {
                    do
                    {
                        try self.managedObjectContext.save()
                    }
                    catch
                    {
                    }
                    
                    completion?()
                }
            }
            else
            {
                completion?()
            }
        }
    }
    
    func create(
        entity:NSManagedObject.Type,
        completion:@escaping((NSManagedObject?) -> ()))
    {
        managedObjectContext.perform
        {
            if let entityDescription:NSEntityDescription = NSEntityDescription.entity(
                forEntityName:entity.entityName,
                in:self.managedObjectContext)
            {
                let managedObject:NSManagedObject = NSManagedObject(
                    entity:entityDescription,
                    insertInto:self.managedObjectContext)
                
                completion(managedObject)
            }
            else
            {
                completion(nil)
            }
        }
    }
    
    func fetch(
        entity:NSManagedObject.Type,
        limit:Int = 0,
        predicate:NSPredicate? = nil,
        sorters:[NSSortDescriptor]? = nil,
        completion:@escaping(([NSManagedObject]?) -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        {
            let fetchRequest:NSFetchRequest<NSManagedObject> = NSFetchRequest(
                entityName:entity.entityName)
            fetchRequest.predicate = predicate
            fetchRequest.sortDescriptors = sorters
            fetchRequest.fetchLimit = limit
            fetchRequest.returnsObjectsAsFaults = false
            fetchRequest.includesPropertyValues = true
            fetchRequest.includesSubentities = true
            
            self.managedObjectContext.perform
            {
                let results:[NSManagedObject]?
                
                do
                {
                    results = try self.managedObjectContext.fetch(fetchRequest)
                }
                catch
                {
                    results = nil
                }
                
                completion(results)
            }
        }
    }
    
    func delete(data:NSManagedObject, completion:(() -> ())? = nil)
    {
        managedObjectContext.perform
        {
            self.managedObjectContext.delete(data)
            completion?()
        }
    }
}
