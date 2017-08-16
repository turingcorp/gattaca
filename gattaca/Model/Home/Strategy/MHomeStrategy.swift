import Foundation

class MHomeStrategy
{
    private(set) weak var controller:CHome?
    private let kDelay:TimeInterval = 5
    
    required init(controller:CHome)
    {
        self.controller = controller
    }
    
    //MARK: internal
    
    func refreshStrategy()
    {
        guard
            
            let controller:CHome = self.controller
            
        else
        {
            return
        }
        
        controller.model.loadStrategy(
            controller:controller)
    }
    
    func delayAndRefresh()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).asyncAfter(
            deadline:DispatchTime.now())
        { [weak self] in
            
            self?.refreshStrategy()
        }
    }
    
    func nextStep()
    {
    }
}
