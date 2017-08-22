import Foundation

extension MGifStrategyDownload
{
    private static let kTimeout:TimeInterval = 45
    private static let kDelay:TimeInterval = 1
    private static let kStatusCodeOk:Int = 200
    
    //MARK: private
    
    private class func factoryRequest(url:URL) -> URLRequest
    {
        let request:URLRequest = MRequest.factoryGetRequest(
            url:url,
            timeout:kTimeout)
        
        return request
    }
    
    private func delayDownloadNext()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).asyncAfter(
            deadline:DispatchTime.now() + MGifStrategyDownload.kDelay)
        { [weak self] in
            
            self?.downloadNext()
        }
    }
    
    private func downloadResponse(
        gif:DGif,
        fileUrl:URL?,
        urlResponse:URLResponse?,
        error:Error?)
    {
        removeAndDelay(gif:gif)
        
        guard
        
            let data:Data = downloadedData(
                fileUrl:fileUrl,
                urlResponse:urlResponse,
                error:error)
        
        else
        {
            return
        }
        
        saveGifData(
            gif:gif,
            data:data)
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
            delayDownloadNext()
            
            return
        }
        
        print(url.path)
        
        let request:URLRequest = MGifStrategyDownload.factoryRequest(
            url:url)
        
        let downloadTask:URLSessionDownloadTask = session.downloadTask(
            with:request)
        { [weak self] (fileUrl:URL?, urlResponse:URLResponse?, error:Error?) in
            
            self?.downloadResponse(
                gif:gif,
                fileUrl:fileUrl,
                urlResponse:urlResponse,
                error:error)
        }
        
        downloadTask.resume()
    }
    
    private func downloadedData(
        fileUrl:URL?,
        urlResponse:URLResponse?,
        error:Error?) -> Data?
    {
        if let _:Error = error
        {
            return nil
        }
        
        guard
        
            let statusCode:Int = urlResponse?.httpStatusCode
        
        else
        {
            return nil
        }
        
        if statusCode == MGifStrategyDownload.kStatusCodeOk
        {
            guard
                
                let fileUrl:URL = fileUrl
                
            else
            {
                return nil
            }
            
            let data:Data
            
            do
            {
                try data = Data(
                    contentsOf:fileUrl,
                    options:Data.ReadingOptions.uncached)
            }
            catch
            {
                return nil
            }
            
            return data
        }
        
        return nil
    }
    
    func factoryUrl(identifier:String) -> URL?
    {
        var urlString:String = downloadPrefix
        urlString.append(identifier)
        urlString.append(downloadSuffix)
        
        let url:URL? = URL(string:urlString)
        
        return url
    }
    
    func removeAndDelay(gif:DGif)
    {
        if let firstItem:DGif = model.itemsNotReady.first
        {
            if firstItem === gif
            {
                model.itemsNotReady.removeFirst()
            }
        }
        
        delayDownloadNext()
    }
}
