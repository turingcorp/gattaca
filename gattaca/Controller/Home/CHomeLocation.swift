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
        let controller:CLocationDenied = CLocationDenied(
            session:model.session)
        
        parent()?.animateOver(
            controller:controller)
    }
}
