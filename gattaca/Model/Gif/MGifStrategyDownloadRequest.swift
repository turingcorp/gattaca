import Foundation

extension MGifStrategyDownload
{
    //MARK: private
    
    private func requestSuccess(
        gif:DGif,
        fileUrl:URL?)
    {/*
        guard
            
            let fileUrl:URL = fileUrl
            
        else
        {
            let message:String = String.localizedModel(
                key:"MGifStrategyDownload_unknownError")
            downloadError(message:message)
            downloadFailed(gif:gif)
            
            return
        }
        
        let data:Data
        
        do
        {
            try data = Data(
                contentsOf:fileUrl,
                options:Data.ReadingOptions.uncached)
        }
        catch let error
        {
            downloadFailed(gif:gif)
            downloadError(message:error.localizedDescription)
            
            return
        }
        
        requestSuccess(gif:gif, data:data)*/
    }
    
    private func downloadError(message:String)
    {
        VAlert.messageFail(message:message)
    }
    
    //MARK: internal
    
    func downloadNext()
    {
        guard
            
            let gif:DGif = model.itemsNotReady.first,
            let identifier:String = gif.identifier,
            let url:URL = factoryUrl(identifier:identifier)
            
        else
        {
            model.strategyStand()
            
            return
        }
        
        print(url.path)
        
        /*
         let request:URLRequest = MRequest.factoryGetRequest(
         url:url,
         timeout:kTimeout)
         
         let downloadTask:URLSessionDownloadTask = session.downloadTask(
         with:request)
         { [weak self] (fileUrl:URL?, urlResponse:URLResponse?, error:Error?) in
         
         if let error:Error = error
         {
         self?.downloadError(message:error.localizedDescription)
         self?.downloadFailed(gif:gif)
         }
         else
         {
         self?.requestSuccess(gif:gif, fileUrl:fileUrl)
         }
         }
         
         downloadTask.resume()*/
    }
    
    func factoryUrl(identifier:String) -> URL?
    {
        var urlString:String = downloadPrefix
        urlString.append(identifier)
        urlString.append(downloadSuffix)
        
        let url:URL? = URL(string:urlString)
        
        return url
    }
    
    func downloadWithDelay()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).asyncAfter(
            deadline:DispatchTime.now() + kDelayDownloadNext)
        { [weak self] in
            
//            self?.dispatchDownload()
        }
    }
}
