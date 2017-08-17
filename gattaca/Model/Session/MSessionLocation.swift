import Foundation

extension MSession
{
    //MARK: internal
    
    func clearDifferentLocations(country:String)
    {
    }
    
    func syncNewLocation(
        latitude:Double,
        longitude:Double,
        country:String,
        completion:@escaping(() -> ()))
    {
        coreDataLocation(
            country:country)
        { [weak self] in
            
            self?.firebaseLocation(
                latitude:latitude,
                longitude:longitude,
                country:country)
            {
                completion()
            }
        }
    }
    
    func coreDataLocation(
        country:String,
        completion:@escaping(() -> ()))
    {
        
    }
    
    func firebaseLocation(
        latitude:Double,
        longitude:Double,
        country:String,
        completion:@escaping(() -> ()))
    {
        
    }
}
