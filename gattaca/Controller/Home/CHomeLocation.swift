import Foundation

extension CHome
{
    func openAskAuthLocation()
    {
        let controller:CLocationAsk = CLocationAsk(
            session:model.session)
        
        parent()?.animateOver(
            controller:controller)
    }
    
    func openAskDeniedLocation()
    {
        
    }
}
