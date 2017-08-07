import Foundation

extension MHome
{
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
        
            let request:URLRequest = MHomeGiphyUrl.factoryRandom()
        
        else
        {
            return
        }
        
        let task:URLSessionTask = session.dataTask(with:request)
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
        
        self.task = task
        task.resume()
    }
    
    private func requestError(error:Error?)
    {
        print("error: \(error)")
    }
    
    private func requestError(statusCode:Int)
    {
        print("error \(statusCode)")
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
                options:JSONSerialization.ReadingOptions.allowFragments)
        }
        catch let error
        {
            requestError(error:error)
            
            return
        }
        
        requestSuccess(json:json)
    }
    
    private func requestSuccess(json:Any)
    {
        
    }
}
