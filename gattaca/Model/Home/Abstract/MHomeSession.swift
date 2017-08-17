import Foundation

extension MHome
{
    //MARK: internal
    
    func loadStrategy(controller:CHome)
    {
        strategy = MHomeStrategy.factoryStrategy(
            controller:controller)
        strategy?.nextStep()
    }
    
    func authLocation(controller:CHome)
    {
        session.statusAuthLocation()
        loadStrategy(controller:controller)
    }
    
    func waitForLocation(controller:CHome)
    {
        session.statusWaitingLocation()
        loadStrategy(controller:controller)
    }
}
