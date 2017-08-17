import Foundation

extension MSession
{
    //MARK: private
    
    private func removeCountryUser(
        country:String,
        userId:String)
    {
        let countries:FDatabaseCountries = FDatabaseCountries()
        let country:FDatabaseCountriesItem = FDatabaseCountriesItem(
            parent:countries,
            identifier:country)
        let user:FDatabaseCountriesItemUser = FDatabaseCountriesItemUser(
            parent:country,
            identifier:userId)
        
        let firebase:FDatabase = FDatabase()
        firebase.remove(model:user)
    }
    
    //MARK: internal
    
    func clearDifferentLocations(country:String)
    {
        guard
        
            let storedCountry:String = session?.country,
            let userId:String = session?.userId
        
        else
        {
            return
        }
        
        if storedCountry != country
        {
            removeCountryUser(
                country:country,
                userId:userId)
        }
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
