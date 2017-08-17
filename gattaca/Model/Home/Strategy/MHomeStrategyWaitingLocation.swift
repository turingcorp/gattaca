import Foundation

class MHomeStrategyWaitingLocation:MHomeStrategy
{
    private var delegate:MHomeStrategyWaitingLocationDelegate?
    
    deinit
    {
        delegate?.locationManager.stopUpdatingLocation()
        delegate?.locationManager.delegate = nil
    }
    
    override func nextStep()
    {
        super.nextStep()
        
        guard
            
            let controller:CHome = self.controller
        
        else
        {
            return
        }
        
        delegate = MHomeStrategyWaitingLocationDelegate(
            controller:controller)
    }
}
