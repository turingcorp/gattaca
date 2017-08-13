import Foundation
import CoreData

class DManager
{
    let managedObjectContext:NSManagedObjectContext
    
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
    
    func save(completion:@escaping(() -> ()))
    {
        if managedObjectContext.hasChanges
        {
            managedObjectContext.perform
            { [weak self] in
                
                guard
                
                    let managedObjectContext:NSManagedObjectContext = self?.managedObjectContext
                
                else
                {
                    return
                }
                
                do
                {
                    try managedObjectContext.save()
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
        { [weak self] in
            
            guard
                
                let managedObjectContext:NSManagedObjectContext = self?.managedObjectContext,
                let entityDescription:NSEntityDescription = NSEntityDescription.entity(
                    forEntityName:entity.entityName,
                    in:managedObjectContext)
                
            else
            {
                return
            }
            
            let managedObject:NSManagedObject = NSManagedObject(
                entity:entityDescription,
                insertInto:managedObjectContext)
            
            completion(managedObject)
        }
    }
    
    func fetch(
        entity:NSManagedObject.Type,
        limit:Int = 0,
        predicate:NSPredicate? = nil,
        sorters:[NSSortDescriptor]? = nil,
        completion:@escaping(([NSManagedObject]?) -> ()))
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
        { [weak self] in
            
            guard
                
                let managedObjectContext:NSManagedObjectContext = self?.managedObjectContext
                
            else
            {
                return
            }
            
            let results:[NSManagedObject]?
            
            do
            {
                results = try managedObjectContext.fetch(fetchRequest)
            }
            catch
            {
                results = nil
            }
            
            completion(results)
        }
    }
    
    func delete(data:NSManagedObject, completion:@escaping(() -> ()))
    {
        managedObjectContext.perform
        { [weak self] in
            
            guard
                
                let managedObjectContext:NSManagedObjectContext = self?.managedObjectContext
                
            else
            {
                return
            }
            
            managedObjectContext.delete(data)
            completion()
        }
    }
}
