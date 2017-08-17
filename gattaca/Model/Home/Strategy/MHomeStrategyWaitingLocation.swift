import Foundation

class MHomeStrategyWaitingLocation:MHomeStrategy
{
    private var delegate:MHomeStrategyWaitingLocationDelegate?
    
    deinit
    {
        delegate?.locationManager?.stopUpdatingLocation()
        delegate?.locationManager?.delegate = nil
    }
    
    override func nextStep()
    {
        super.nextStep()
        
        DispatchQueue.main.async
        { [weak self] in
            
            self?.factoryDelegate()
        }
    }
    
    //MARK: private
    
    private func factoryDelegate()
    {
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
