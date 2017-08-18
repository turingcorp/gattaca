import Foundation

class MHomeStrategySyncLocation:MHomeStrategy
{
    override func nextStep()
    {
        super.nextStep()
        
        delayAndRefresh()
    }
}
