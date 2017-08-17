import Foundation

class MLocationAsk:Model
{
    let locationDelegate:MLocationAskDelegate
    
    required init(session:MSession)
    {
        locationDelegate = MLocationAskDelegate()
        
        super.init(session:session)
    }
    
    deinit
    {
        locationDelegate.locationManager?.delegate = nil
    }
}
