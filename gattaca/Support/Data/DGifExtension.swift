import Foundation

extension DGif
{
    enum Mark:Int16
    {
        case none
        case hate
        case meh
        case like
    }
    
    enum Status:Int16
    {
        case new
        case loading
        case waiting
        case marked
        case cleaned
    }
    
    var mark:Mark
    {
        get
        {
            let mark:Mark = Mark(rawValue:markRaw)!
            
            return mark
        }
    }
    
    var status:Status
    {
        get
        {
            let status:Status = Status(rawValue:statusRaw)!
            
            return status
        }
    }
    
    func newGif(identifier:String)
    {
        self.identifier = identifier
        self.created = Date().timeIntervalSince1970
    }
    
    func factoryPath(directory:URL) -> URL?
    {
        guard
        
            let identifier:String = self.identifier
        
        else
        {
            return nil
        }
        
        var fileName:String = identifier
        fileName.append(DGif.kExtension)
        let path:URL = directory.appendingPathComponent(fileName)
        
        return path
    }
    
    func statusLoading()
    {
        statusRaw = Status.loading.rawValue
        DManager.sharedInstance?.save()
    }
    
    func statusNew()
    {
        statusRaw = Status.new.rawValue
        DManager.sharedInstance?.save()
    }
    
    func statusWaiting()
    {
        statusRaw = Status.waiting.rawValue
        DManager.sharedInstance?.save()
    }
}
