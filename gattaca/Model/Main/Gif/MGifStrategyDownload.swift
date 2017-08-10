import Foundation

class MGifStrategyDownload:MGifStrategy
{
    private var downloadPrefix:String
    private var downloadSuffix:String
    private let session:URLSession
    private let kKeyGiphy:String = "giphy"
    private let kKeyDownloadPrefix:String = "download_prefix"
    private let kKeyDownloadSuffix:String = "download_suffix"
    private let kDelayDownloadNext:TimeInterval = 1
    private let kTimeout:TimeInterval = 45
    
    override init(model:MGif)
    {
        downloadPrefix = ""
        downloadSuffix = ""
        session = MRequest.factorySession()
        
        super.init(model:model)
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.dispatchDownload()
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
    
    private func dispatchDownload()
    {
        guard
        
            let gif:DGif = MSession.sharedInstance.gif.firstItemNew()
        
        else
        {
            model.strategyStand()
            
            return
        }
        
        gif.statusLoading()
    }
    
    private func requestGif(gif:DGif)
    {
        guard
        
            let identifier:String = gif.identifier
        
        else
        {
            downloadNext()
            
            return
        }
        
        var urlString:String = downloadPrefix
        urlString.append(identifier)
        urlString.append(downloadSuffix)
        
        guard
        
            let url:URL = URL(string:urlString)
        
        else
        {
            downloadNext()
            
            return
        }
        
        requestGif(gif:gif, url:url)
    }
    
    private func requestGif(gif:DGif, url:URL)
    {
        let request:URLRequest = MRequest.factoryGetRequest(
            url:url,
            timeout:kTimeout)
        
        let downloadTask:URLSessionDownloadTask = session.downloadTask(
            with:request)
        { [weak self] (fileUrl:URL?, urlResponse:URLResponse?, error:Error?) in
            
            if let error:Error = error
            {
                self?.downloadError(message:error.localizedDescription)
            }
            else
            {
                self?.requestSuccess(gif:gif, fileUrl:fileUrl)
            }
        }
        
        downloadTask.resume()
    }
    
    private func requestSuccess(
        gif:DGif,
        fileUrl:URL?)
    {
        guard
            
            let fileUrl:URL = fileUrl
            
        else
        {
            let message:String = String.localizedModel(
                key:"MGifStrategyDownload_unknownError")
            requestError(error:nil)
            
            return
        }
        
        let data:Data
        
        do
        {
            try data = Data(
                contentsOf:url,
                options:Data.ReadingOptions.uncached)
        }
        catch let error
        {
            requestError(error:error)
            
            return
        }
        
        requestDownloadSuccess(data:data)
    }
    
    private func requestDownloadSuccess(data:Data)
    {
        //        guard
        //
        //            let temporalUrl:URL = data.writeToTemporal(
        //                withExtension:MHome.kFileExtension)
        //
        //        else
        //        {
        //            return
        //        }
        
        //        let item:MHomeItem = MHomeItem(url:temporalUrl)
        //        addItem(item:item)
    }
    
    private func downloadError(message:String)
    {
        VAlert.messageFail(message:message)
        
        model.strategyStand()
    }
    
    private func downloadNext()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).asyncAfter(
            deadline:DispatchTime.now() + kDelayDownloadNext)
        { [weak self] in
            
            self?.dispatchDownload()
        }
    }
}
