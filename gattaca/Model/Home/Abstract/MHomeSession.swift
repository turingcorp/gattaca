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
    
    func loadLocation(controller:CHome)
    {
        session.authLocation
        { [weak self, weak controller] in
            
            guard
                
                let controller:CHome = controller
            
            else
            {
                return
            }
            
            self?.loadStrategy(controller:controller)
        }
        
        loadStrategy(controller:controller)
    }
}
