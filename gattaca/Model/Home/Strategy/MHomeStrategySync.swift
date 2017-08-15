import Foundation

class MHomeStrategySync:MHomeStrategy
{
    private let kDelay:TimeInterval = 5
    
    override func nextStep()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).asyncAfter(
            deadline:DispatchTime.now())
        { [weak self] in
            
            guard
                
                let controller:CHome = self?.controller
                
            else
            {
                return
            }
            
            self?.controller.model.loadStrategy(controller:controller)
        }
    }
}
