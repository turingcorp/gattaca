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
    
    func syncLocation(
        latitude:Double,
        longitude:Double,
        country:String,
        completion:@escaping(() -> ()))
    {
        status = MSession.Status.syncLocation
        clearDifferentLocations(country:country)
        
        syncNewLocation(
            latitude:latitude,
            longitude:longitude,
            country:country)
        {
            completion()
        }
    }
    
    func clearDifferentLocations(country:String)
    {
        guard
        
            let storedCountry:String = data?.country,
            let userId:String = data?.userId
        
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
        guard
        
            let coreData:Database = Database(bundle:nil)
        
        else
        {
            return
        }
        
        coreData.fetch
        { (data:[DSession]) in
            
            guard
                
                let session:DSession = data.first
                
            else
            {
                return
            }
            
            session.country = country
            
            coreData.save
            { [weak self] in
                
                self?.updateSession(session:session)
                
                completion()
            }
        }
    }
    
    func firebaseLocation(
        latitude:Double,
        longitude:Double,
        country:String,
        completion:@escaping(() -> ()))
    {
        
    }
}
