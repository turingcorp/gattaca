import Foundation

extension MHome
{
    private static let kLimit:Int = 3
    private static let kStatusCodeSuccess:Int = 200
    
    func requestGif()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.dispatchRequestGif()
        }
    }
    
    //MARK: private
    
    private func dispatchRequestGif()
    {
        guard
            
            let request:URLRequest = MGiphy.factoryTrendingRequest(
                offset:requestOffset,
                limit:MHome.kLimit)
            
        else
        {
            return
        }
        
        let sessionTask:URLSessionDataTask = session.dataTask(with:request)
        { [weak self] (data:Data?, urlResponse:URLResponse?, error:Error?) in
            
            guard
                
                let statusCode:Int = urlResponse?.httpStatusCode
                
            else
            {
                self?.requestError(error:error)
                
                return
            }
            
            if statusCode == MHome.kStatusCodeSuccess
            {
                self?.requestSuccess(data:data)
            }
            else
            {
                guard
                    
                    let error:Error = error
                    
                else
                {
                    self?.requestError(statusCode:statusCode)
                    
                    return
                }
                
                self?.requestError(error:error)
            }
        }
        
        self.sessionTask = sessionTask
        sessionTask.resume()
    }
    
    private func requestError(error:Error?)
    {
        let message:String
        
        if let error:Error = error
        {
            message = error.localizedDescription
        }
        else
        {
            message = String.localizedModel(
                key:"MHome_unknownError")
        }
        
        VAlert.messageFail(message:message)
    }
    
    private func requestError(statusCode:Int)
    {
        let message:String = String.localizedModel(
            key:"MHome_errorCode")
        VAlert.messageFail(message:message)
    }
    
    private func requestSuccess(data:Data?)
    {
        guard
            
            let data:Data = data
            
        else
        {
            requestError(error:nil)
            
            return
        }
        
        let json:Any
        
        do
        {
            try json = JSONSerialization.jsonObject(
                with:data,
                options:
                JSONSerialization.ReadingOptions.allowFragments)
        }
        catch let error
        {
            requestError(error:error)
            
            return
        }
        
        print(json)
        requestSuccess(json:json)
    }
    
    private func requestSuccess(json:Any)
    {
        requestOffset += MHome.kLimit
        
        let items:[MGiphyItem] = MGiphy.factoryItems(
            json:json)
        let purged:[MGiphyItem] = MSession.sharedInstance.gif.purgeItems(
            items:items)
        let countPurged:Int = purged.count
        
        if countPurged > 0
        {
            
        }
        else
        {
            requestGif()
        }
    }
    
    private func requestDataSuccess(json:Any)
    {
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
}
