import Foundation
import CoreData

extension Database
{
    private static let kModelName:String = "DGattaca"
    private static let kModelExtension:String = "momd"
    private static let kSQLiteExtension:String = ".sqlite"
    private static let kBundleSeparator:String = "."
    private static let kEmptyString:String = ""
    
    class func factoryManagedObjectContext(bundle:Bundle?) -> NSManagedObjectContext?
    {
        guard
            
            let managedObjectModel:NSManagedObjectModel = factoryManagedObjectModel(),
            let persistentStoreCoordinator:NSPersistentStoreCoordinator = factoryPersistentStoreCoordinator(
                bundle:bundle,
                managedObjectModel:managedObjectModel)
            
        else
        {
            return nil
        }
        
        let managedObjectContext:NSManagedObjectContext = NSManagedObjectContext(
            concurrencyType:
            NSManagedObjectContextConcurrencyType.privateQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        managedObjectContext.mergePolicy = NSMergePolicy(
            merge:NSMergePolicyType.mergeByPropertyStoreTrumpMergePolicyType)
        
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
        bundle:Bundle?,
        managedObjectModel:NSManagedObjectModel) -> NSPersistentStoreCoordinator?
    {
        let url:URL = factoryCoordinatorUrl(bundle:bundle)
        let persistentStoreCoordinator:NSPersistentStoreCoordinator = NSPersistentStoreCoordinator(
            managedObjectModel:managedObjectModel)
        
        do
        {
            try persistentStoreCoordinator.addPersistentStore(
                ofType:NSSQLiteStoreType,
                configurationName:nil,
                at:url,
                options:nil)
        }
        catch
        {
            return nil
        }
        
        return persistentStoreCoordinator
    }
    
    class func factoryCoordinatorUrl(bundle:Bundle?) -> URL
    {
        let storeBundle:Bundle
        let bundleIdentifier:String
        
        if let bundle:Bundle = bundle
        {
            storeBundle = bundle
        }
        else
        {
            storeBundle = Bundle.main
        }
        
        if let identifier:String = storeBundle.bundleIdentifier
        {
            bundleIdentifier = identifier
        }
        else
        {
            bundleIdentifier = kEmptyString
        }
        
        var sqliteFile:String = bundleIdentifier
        sqliteFile.append(kBundleSeparator)
        sqliteFile.append(kModelName)
        sqliteFile.append(kSQLiteExtension)
        
        let url:URL = FileManager.appDirectory.appendingPathComponent(
            sqliteFile)
        
        return url
    }
}
