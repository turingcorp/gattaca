import Foundation

extension MHome
{
    private static let kLimit:Int = 3
    private static let kStatusCodeSuccess:Int = 200
    
    //MARK: private
    
    private func requestError()
    {
        let message:String = String.localizedModel(
            key:"MHome_requestError")
        
        view?.loadError(message:message)
    }
    
    //MARK: internal
    
    func requestGifs()
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
        
        let sessionTask:URLSessionDataTask = urlSession.dataTask(with:request)
        { [weak self] (data:Data?, urlResponse:URLResponse?, error:Error?) in
            
            guard
            
                let items:[MGiphyItem] = self?.requestGifsResponse(
                    data:data,
                    urlResponse:urlResponse,
                    error:error)
            
            else
            {
                self?.requestError()
                
                return
            }
            
            self?.requestGifsSuccess(items:items)
        }
        
        sessionTask.resume()
    }
    
    func requestGifsResponse(
        data:Data?,
        urlResponse:URLResponse?,
        error:Error?) -> [MGiphyItem]?
    {
        guard
            
            let statusCode:Int = urlResponse?.httpStatusCode
            
        else
        {
            return nil
        }
        
        if statusCode == MHome.kStatusCodeSuccess
        {
            guard
                
                let json:Any = requestGifsResponse(
                    data:data),
                let items:[MGiphyItem] = MGiphy.factoryItems(
                    json:json)
            
            else
            {
                return nil
            }
            
            return items
        }
        
        return nil
    }
    
    func requestGifsResponse(data:Data?) -> Any?
    {
        guard
            
            let data:Data = data
            
        else
        {
            return nil
        }
        
        let json:Any
        
        do
        {
            try json = JSONSerialization.jsonObject(
                with:data,
                options:
                JSONSerialization.ReadingOptions.allowFragments)
        }
        catch
        {
            return nil
        }
        
        return json
    }
    
    func requestGifsSuccess(items:[MGiphyItem])
    {
         requestOffset += MHome.kLimit
        
         let purged:[MGiphyItem] = gif.purgeItems(items:items)
         let countPurged:Int = purged.count
         
         if countPurged > 0
         {
            gif.storeItems(items:purged)
            { [weak self] in
                
                self?.gif.strategy?.download()
            }
         }
         else
         {
             requestGifs()
         }
    }
}
