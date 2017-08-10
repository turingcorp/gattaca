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
    }
    
    //MARK: private
    
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
            downloadError(message:message)
            
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
            downloadError(message:error.localizedDescription)
            
            return
        }
        
        requestSuccess(gif:gif, data:data)
    }
    
    private func requestSuccess(gif:DGif, data:Data)
    {
        var randomName:String = UUID().uuidString
        
        if let withExtension:String = withExtension
        {
            randomName.append(".")
            randomName.append(withExtension)
        }
        
        let directoryUrl:URL = URL(fileURLWithPath:NSTemporaryDirectory())
        let fileUrl:URL = directoryUrl.appendingPathComponent(randomName)
        
        do
        {
            try write(to:fileUrl, options:Data.WritingOptions.atomicWrite)
        }
        catch
        {
            return nil
        }
        
        return fileUrl
        
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
