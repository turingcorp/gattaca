import Foundation
import CoreData

class Database
{
    let managedObjectContext:NSManagedObjectContext
    
    init?(bundle:Bundle?)
    {
        guard
            
            let managedObjectContext:NSManagedObjectContext = Database.factoryManagedObjectContext(
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
                catch let error
                {
                    assertionFailure(error.localizedDescription)
                    
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
    
    func create<T:NSManagedObject>(
        completion:@escaping((T) -> ()))
    {
        managedObjectContext.perform
        {
            guard
                
                let entityDescription:NSEntityDescription = NSEntityDescription.entity(
                    forEntityName:T.entityName,
                    in:self.managedObjectContext),
                let managedObject:T = NSManagedObject(
                    entity:entityDescription,
                    insertInto:self.managedObjectContext) as? T
                
            else
            {
                return
            }
            
            completion(managedObject)
        }
    }
    
    func fetch<T:NSManagedObject>(
        limit:Int = 0,
        predicate:NSPredicate? = nil,
        sorters:[NSSortDescriptor]? = nil,
        completion:@escaping(([T]) -> ()))
    {
        let fetchRequest:NSFetchRequest<NSManagedObject> = NSFetchRequest(
            entityName:T.entityName)
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sorters
        fetchRequest.fetchLimit = limit
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.includesPropertyValues = true
        fetchRequest.includesSubentities = true
        
        managedObjectContext.perform
        {
            let data:[NSManagedObject]
            
            do
            {
                data = try self.managedObjectContext.fetch(fetchRequest)
            }
            catch
            {
                return
            }
            
            guard
                
                let results:[T] = data as? [T]
                
            else
            {
                return
            }
            
            completion(results)
        }
    }
    
    func delete(data:NSManagedObject, completion:(() -> ())?)
    {
        managedObjectContext.perform
        {
            self.managedObjectContext.delete(data)
            completion?()
        }
    }
}
