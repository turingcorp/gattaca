import Foundation

class MHomeStrategyAuthLocationStrategyGranted:MHomeStrategyAuthLocationStrategy
{
    override func nextStep()
    {
        super.nextStep()
      
        guard
            
            let controller:CHome = self.controller
        
        else
        {
            return
        }
        
        controller.model.waitForLocation(
            controller:controller)
    }
}
