import Foundation

class MGifStrategyDownload:MGifStrategy
{
    private var downloadPrefix:String
    private var downloadSuffix:String
    private let kKeyGiphy:String = "giphy"
    private let kKeyDownloadPrefix:String = "download_prefix"
    private let kKeyDownloadSuffix:String = "download_suffix"
    private let kDelayDownloadNext:TimeInterval = 1
    
    override init(model:MGif)
    {
        downloadPrefix = ""
        downloadSuffix = ""
        
        super.init(model:model)
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.dispatchDownload()
        }
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
        let request:URLRequest = MRequest.factoryGetRequest(url:url)
        
        guard
        
        
        
        /*
         guard
         
         let gifRequest:URLRequest = MGiphy.factoryGif(json:json)
         
         else
         {
         requestError(error:nil)
         
         return
         }
         
         let sessionTask:URLSessionDownloadTask = session.downloadTask(
         with:gifRequest)
         { [weak self] (url:URL?, urlResponse:URLResponse?, error:Error?) in
         
         if let error:Error = error
         {
         self?.requestError(error:error)
         
         return
         }
         
         self?.requestDownloadSuccess(url:url)
         }
         
         self.sessionTask = sessionTask
         sessionTask.resume()*/
    }
    
    private func requestDownloadSuccess(url:URL?)
    {
        guard
            
            let url:URL = url
            
            else
        {
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
    
    private func downloadNext()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).asyncAfter(
            deadline:DispatchTime.now() + kDelayDownloadNext)
        { [weak self] in
            
            self?.dispatchDownload()
        }
    }
}
