import Foundation

extension MGif
{
    static let kVideoExtension:String = ".mp4"
    private static let kKeyGif:String = "gif"
    private static let kKeyDirectory:String = "directory"
    
    //MARK: private
    
    private class func directoryName() -> String?
    {
        guard
            
            let urlMap:[String:AnyObject] = MRequest.factoryUrlMap(),
            let gifMap:[String:String] = urlMap[kKeyGif] as? [String:String],
            let directory:String = gifMap[kKeyDirectory]
            
        else
        {
            return nil
        }
        
        return directory
    }
    
    //MARK: internal
    
    class func gifDirectory() -> URL?
    {
        guard
            
            let directory:String = directoryName()
            
        else
        {
            return nil
        }
        
        let appDirectory:URL = FileManager.appDirectory
        let projects:URL = appDirectory.appendingPathComponent(
            directory)
        
        return projects
    }
    
    @discardableResult class func createDirectory() -> URL?
    {
        guard
            
            let gifPath:URL = gifDirectory()
            
        else
        {
            return nil
        }
        
        do
        {
            try FileManager.default.createDirectory(
                at:gifPath,
                withIntermediateDirectories:true,
                attributes:nil)
        }
        catch
        {
            return nil
        }
        
        let excludedPath:URL = URL.excludeFromBackup(
            original:gifPath)
        
        return excludedPath
    }
}
