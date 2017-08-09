import Foundation

extension MHome
{
    func loadItems()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.dispatchLoadItems()
        }
    }
    
    //MARK: private
    
    private func dispatchLoadItems()
    {
        
    }
}
