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
        
        print(request.url!)
        
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
        
        requestSuccess(json:json)
    }
    
    private func requestSuccess(json:Any)
    {/*
        requestOffset += MHome.kLimit
        
        let items:[MGiphyItem] = MGiphy.factoryItems(
            json:json)
        let purged:[MGiphyItem] = MSession.sharedInstance.gif.purgeItems(
            items:items)
        let countPurged:Int = purged.count
        
        if countPurged > 0
        {
            MSession.sharedInstance.gif.storeItems(items:purged)
            {
                MSession.sharedInstance.gif.strategy?.startBackgroundDownload()
            }
        }
        else
        {
            requestGif()
        }*/
    }
}
