import Foundation

extension MHome
{
    private static let kStatusCodeSuccess:Int = 200
    
    func requestRandomGif()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.dispatchRequestRandomGif()
        }
    }
    
    //MARK: private
    
    private func dispatchRequestRandomGif()
    {
        guard
        
            let request:URLRequest = MGiphy.factoryRandom()
        
        else
        {
            return
        }
        
        let task:URLSessionDataTask = session.dataTask(with:request)
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
                self?.requestDataSuccess(data:data)
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
    
    private func requestDataSuccess(data:Data?)
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
        
        requestDataSuccess(json:json)
    }
    
    private func requestDataSuccess(json:Any)
    {
        
    }
}
