import Foundation
import CoreData

extension DManager
{
    private static let kModelName:String = "DGattaca"
    private static let kModelExtension:String = "momd"
    private static let kSQLiteExtension:String = ".sqlite"
    
    class func factoryManagedObjectContext() -> NSManagedObjectContext?
    {
        guard
            
            let managedObjectModel:NSManagedObjectModel = factoryManagedObjectModel(),
            let persistentStoreCoordinator:NSPersistentStoreCoordinator = factoryPersistentStoreCoordinator(
                managedObjectModel:managedObjectModel)
        
        else
        {
            return nil
        }
        
        let managedObjectContext:NSManagedObjectContext = NSManagedObjectContext(
            concurrencyType:
            NSManagedObjectContextConcurrencyType.privateQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        
        return managedObjectContext
    }
    
    class func factoryManagedObjectModel() -> NSManagedObjectModel?
    {
        guard
            
            let modelURL:URL = Bundle.main.url(
                forResource:kModelName,
                withExtension:kModelExtension),
            let managedObjectModel:NSManagedObjectModel = NSManagedObjectModel(
                contentsOf:modelURL)
            
        else
        {
            return nil
        }
        
        return managedObjectModel
    }
    
    class func factoryPersistentStoreCoordinator(
        managedObjectModel:NSManagedObjectModel) -> NSPersistentStoreCoordinator?
    {
        let sqliteFile:String = kModelName.appending(kSQLiteExtension)
        let storeCoordinatorURL:URL = FileManager.appDirectory.appendingPathComponent(
            sqliteFile)
        let persistentStoreCoordinator:NSPersistentStoreCoordinator = NSPersistentStoreCoordinator(
            managedObjectModel:managedObjectModel)
        
        do
        {
            try persistentStoreCoordinator.addPersistentStore(
                ofType:NSSQLiteStoreType,
                configurationName:nil,
                at:storeCoordinatorURL,
                options:nil)
        }
        catch
        {
            return nil
        }
        
        return persistentStoreCoordinator
    }
}
