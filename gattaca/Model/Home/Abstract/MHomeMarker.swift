import Foundation

extension MHome
{
    //MARK: private
    
    private func asyncMarkCurrent(mark:DGif.Mark)
    {
        
    }
    
    //MARK: internal
    
    func markCurrent(mark:DGif.Mark)
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncMarkCurrent(mark:mark)
        }
    }
}
