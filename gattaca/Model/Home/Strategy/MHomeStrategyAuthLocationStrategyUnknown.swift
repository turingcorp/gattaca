import Foundation

class MHomeStrategyAuthLocationStrategyUnknown:MHomeStrategyAuthLocationStrategy
{
    override func nextStep()
    {
        guard
            
            let controller:CHome = self.controller
        
        else
        {
            return
        }
        
        controller.model.askAuthLocation(controller:controller)
    }
}
