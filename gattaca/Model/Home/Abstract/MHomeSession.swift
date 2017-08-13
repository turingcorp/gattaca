import Foundation

extension MHome
{
    //MARK: internal
    
    func loadStrategy(controller:CHome)
    {
        strategy = MHomeStrategy.factoryStrategy(
            controller:controller)
    }
    
    func clearStrategy()
    {
        strategy = nil
    }
}
