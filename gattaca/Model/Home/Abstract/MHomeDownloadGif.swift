import Foundation

extension MHome
{
    private static let kKeyGif:String = "gif"
    private static let kKeySharingName:String = "sharing_name"
    private static let kTimeout:TimeInterval = 30
    
    private class func factorySharingName() -> String?
    {
        guard
            
            let urlMap:[String:AnyObject] = MRequest.factoryUrlMap(),
            let gif:[String:AnyObject] = urlMap[kKeyGif] as? [String:AnyObject]
            
        else
        {
            return nil
        }
        
        let sharingName:String? = gif[kKeySharingName] as? String
        
        return sharingName
    }
    
    func downloadGif(completion:@escaping((URL?) -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncDownloadGif(completion:completion)
        }
    }
    
    //MARK: private
    
    private func asyncDownloadGif(completion:@escaping((URL?) -> ()))
    {
        guard
            
            let item:MHomeItem = items.first,
            let url:URL = MGiphy.factoryShareGifUrl(
                model:item)
            
        else
        {
            completion(nil)
            
            return
        }
        
        downloadGif(url:url, completion:completion)
    }
    
    private func downloadGif(
        url:URL,
        completion:@escaping((URL?) -> ()))
    {
        let request:URLRequest = MRequest.factoryGetRequest(
            url:url,
            timeout:MHome.kTimeout)
        
        let downloadTask:URLSessionDownloadTask = urlSession.downloadTask(
            with:request)
        { [weak self] (fileUrl:URL?, urlResponse:URLResponse?, error:Error?) in
            
            if error == nil
            {
                self?.requestSuccess(url:url, completion:completion)
            }
            else
            {
                completion(nil)
            }
        }
        
        downloadTask.resume()
    }
    
    private func requestSuccess(
        url:URL,
        completion:@escaping((URL?) -> ()))
    {
        let data:Data
        
        do
        {
            try data = Data(contentsOf:url)
        }
        catch
        {
            completion(nil)
            
            return
        }
        
        requestSuccess(data:data, completion:completion)
    }
    
    private func requestSuccess(
        data:Data,
        completion:@escaping((URL?) -> ()))
    {
        guard
            
            let sharingName:String = MHome.factorySharingName()
        
        else
        {
            completion(nil)
            
            return
        }
        
        let directoryUrl:URL = URL(fileURLWithPath:NSTemporaryDirectory())
        let fileUrl:URL = directoryUrl.appendingPathComponent(sharingName)
        
        do
        {
            try data.write(
                to:fileUrl,
                options:Data.WritingOptions.atomicWrite)
        }
        catch
        {
            completion(nil)
            
            return
        }
        
        completion(fileUrl)
    }
}
