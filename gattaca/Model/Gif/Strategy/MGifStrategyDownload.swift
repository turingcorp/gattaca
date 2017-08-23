import Foundation

class MGifStrategyDownload:MGifStrategy
{
    let session:URLSession
    private(set) var downloadPrefix:String
    private(set) var downloadSuffix:String
    private let kKeyGiphy:String = "giphy"
    private let kKeyDownloadPrefix:String = "download_prefix"
    private let kKeyDownloadSuffix:String = "download_suffix"
    
    override init?(model:MGif)
    {
        guard
            
            let urlMap:[String:AnyObject] = MRequest.factoryUrlMap(),
            let giphy:[String:AnyObject] = urlMap[kKeyGiphy] as? [String:AnyObject],
            let downloadPrefix:String = giphy[kKeyDownloadPrefix] as? String,
            let downloadSuffix:String = giphy[kKeyDownloadSuffix] as? String
            
        else
        {
            return nil
        }
        
        self.downloadPrefix = downloadPrefix
        self.downloadSuffix = downloadSuffix
        
        session = MRequest.factorySession()
        
        super.init(model:model)
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.downloadNext()
        }
    }
    
    deinit
    {
        session.invalidateAndCancel()
    }
    
    override func load(
        coreData:Database,
        completion:@escaping (() -> ()))
    {
        super.load(
            coreData:coreData,
            completion:completion)
        
        completion()
    }
}
