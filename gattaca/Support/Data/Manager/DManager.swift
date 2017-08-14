import Foundation
import CoreData

class DManager
{
    let managedObjectContext:NSManagedObjectContext
    
    init?(bundle:Bundle?)
    {
        guard
        
            let managedObjectContext:NSManagedObjectContext = DManager.factoryManagedObjectContext(
                bundle:bundle)
        
        else
        {
            return nil
        }
        
        self.managedObjectContext = managedObjectContext
    }
    
    //MARK: internal
    
    func save(completion:@escaping(() -> ()))
    {
        if managedObjectContext.hasChanges
        {
            managedObjectContext.perform
            {
                do
                {
                    try self.managedObjectContext.save()
                }
                catch
                {
                    return
                }
                
                completion()
            }
        }
        else
        {
            completion()
        }
    }
    
    func create(
        entity:NSManagedObject.Type,
        completion:@escaping((NSManagedObject) -> ()))
    {
        managedObjectContext.perform
        {
            guard
                
                let entityDescription:NSEntityDescription = NSEntityDescription.entity(
                    forEntityName:entity.entityName,
                    in:self.managedObjectContext)
                
            else
            {
                return
            }
            
            let managedObject:NSManagedObject = NSManagedObject(
                entity:entityDescription,
                insertInto:self.managedObjectContext)
            
            completion(managedObject)
        }
    }
    
    func fetch(
        entity:NSManagedObject.Type,
        limit:Int = 0,
        predicate:NSPredicate? = nil,
        sorters:[NSSortDescriptor]? = nil,
        completion:@escaping(([NSManagedObject]) -> ()))
    {
        let fetchRequest:NSFetchRequest<NSManagedObject> = NSFetchRequest(
            entityName:entity.entityName)
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sorters
        fetchRequest.fetchLimit = limit
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.includesPropertyValues = true
        fetchRequest.includesSubentities = true
        
        managedObjectContext.perform
        {
            let results:[NSManagedObject]
            
            do
            {
                results = try self.managedObjectContext.fetch(fetchRequest)
            }
            catch
            {
                return
            }
            
            completion(results)
        }
    }
    
    func delete(data:NSManagedObject, completion:@escaping(() -> ()))
    {
        managedObjectContext.perform
        {
            self.managedObjectContext.delete(data)
            completion()
        }
    }
}
