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
        session.status = MSession.Status.authLocation
        loadStrategy(controller:controller)
    }
    
    func waitForLocation(controller:CHome)
    {
        session.status = MSession.Status.waitingLocation
        loadStrategy(controller:controller)
    }
}
