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
        session.load(
            coreData:coreData,
            completion:completion)
    }
    
    func syncSessionLocation(
        latitude:Double,
        longitude:Double,
        country:String,
        completion:@escaping(() -> ()))
    {
        guard
            
            let coreData:Database = self.coreData
            
        else
        {
            return
        }
        
        session.syncLocation(
            coreData:coreData,
            latitude:latitude,
            longitude:longitude,
            country:country,
            completion:completion)
    }
    
    func loadStrategy(controller:CHome)
    {
        strategy = MHomeStrategy.factoryStrategy(
            controller:controller)
        strategy?.nextStep()
    }
    
    func authLocation(controller:CHome)
    {
        status = MHome.Status.authLocation
        loadStrategy(controller:controller)
    }
}
