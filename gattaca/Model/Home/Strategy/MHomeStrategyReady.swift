import Foundation

class MHomeStrategyReady:MHomeStrategy
{
    override func controllerDidAppear(controller:CHome)
    {
        super.controllerDidAppear(controller:controller)
        
        controller.model.authLocation(controller:controller)
    }
    
    override func nextStep()
    {
        super.nextStep()
        
        controller?.model.loadItems()
    }
}
