import Foundation

class MHomeStrategyNew:MHomeStrategy
{
    override func nextStep()
    {
        super.nextStep()
        
        controller?.model.loadSession
        { [weak self] in
            
            self?.sessionLoaded()
        }
    }
    
    //MARK: private
    
    private func sessionLoaded()
    {
        controller?.model.status = MHome.Status.authLocation
        refreshStrategy()
    }
}
