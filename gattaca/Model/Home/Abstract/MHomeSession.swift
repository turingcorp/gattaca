import Foundation

extension MHome
{
    //MARK: internal
    
    func loadSession(completion:@escaping(() -> ()))
    {
        guard
        
            let coreData:Database = Database(bundle:nil)
        
        else
        {
            return
        }
        
        self.coreData = coreData
        
        session.load(coreData:coreData)
        {
            completion()
        }
    }
    
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
