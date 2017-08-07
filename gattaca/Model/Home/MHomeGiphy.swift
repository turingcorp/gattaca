import Foundation

extension MHome
{
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
        
            let url:URL = MHomeGiphyUrl.factoryRandom()
        
        else
        {
            return
        }
        
        
    }
}
