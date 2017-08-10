import Foundation

class MGifStrategyDownload:MGifStrategy
{
    let session:URLSession
    let kTimeout:TimeInterval = 45
    let kDelayDownloadNext:TimeInterval = 1
    private(set) var downloadPrefix:String
    private(set) var downloadSuffix:String
    private let kKeyGiphy:String = "giphy"
    private let kKeyDownloadPrefix:String = "download_prefix"
    private let kKeyDownloadSuffix:String = "download_suffix"
    
    override init(model:MGif)
    {
        downloadPrefix = ""
        downloadSuffix = ""
        session = MRequest.factorySession()
        
        super.init(model:model)
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.factoryUrl()
        }
    }
    
    deinit
    {
        session.invalidateAndCancel()
    }
    
    //MARK: private
    
    private func factoryUrl()
    {
        guard
            
            let urlMap:[String:AnyObject] = MRequest.factoryUrlMap(),
            let giphyRoot:[String:AnyObject] = urlMap[kKeyGiphy] as? [String:AnyObject],
            let downloadPrefix:String = giphyRoot[kKeyDownloadPrefix] as? String,
            let downloadSuffix:String = giphyRoot[kKeyDownloadSuffix] as? String
            
        else
        {
            model.strategyStand()
            
            return
        }
        
        self.downloadPrefix = downloadPrefix
        self.downloadSuffix = downloadSuffix
        
        dispatchDownload()
    }
    
    //MARK: internal
    
    func downloadFailed(gif:DGif?)
    {
        gif?.statusNew()
        model.strategyStand()
    }
}
