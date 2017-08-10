import Foundation

extension MGifStrategyDownload
{
    func dispatchDownload()
    {
        guard
            
            let gif:DGif = MSession.sharedInstance.gif.firstItemNew()
            
        else
        {
            model.strategyStand()
            
            return
        }
        
        gif.statusLoading()
        requestGif(gif:gif)
    }
    
    func downloadWithDelay()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).asyncAfter(
            deadline:DispatchTime.now() + kDelayDownloadNext)
        { [weak self] in
            
            self?.dispatchDownload()
        }
    }
    
    //MARK: private
    
    private func requestGif(gif:DGif)
    {
        guard
            
            let identifier:String = gif.identifier
            
        else
        {
            downloadWithDelay()
            
            return
        }
        
        var urlString:String = downloadPrefix
        urlString.append(identifier)
        urlString.append(downloadSuffix)
        
        guard
            
            let url:URL = URL(string:urlString)
            
        else
        {
            downloadWithDelay()
            
            return
        }
        
        print(urlString)
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
                self?.downloadFailed(gif:gif)
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
        
        requestSuccess(gif:gif, data:data)
    }
    
    private func downloadError(message:String)
    {
        VAlert.messageFail(message:message)
    }
}
