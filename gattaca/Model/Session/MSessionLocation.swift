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
        
        let firebase:FDatabase = FDatabase()
        firebase.remove(parent:country, identifier:userId)
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
            
            self?.firebaseUserLocation(
                country:country)
            { [weak self] in
                
                self?.firebaseCountryUser(
                    latitude:latitude,
                    longitude:longitude,
                    country:country)
                {
                    completion()
                }
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
        { [weak self] (data:[DSession]) in
            
            guard
                
                let session:DSession = data.first
                
            else
            {
                return
            }
            
            session.country = country
            self?.updateSession(session:session)
            
            coreData.save
            {
                completion()
            }
        }
    }
    
    func firebaseUserLocation(
        country:String,
        completion:@escaping(() -> ()))
    {
        guard
            
            let userId:String = data?.userId
        
        else
        {
            return
        }
        
        let users:FDatabaseUsers = FDatabaseUsers()
        let user:FDatabaseUsersItem = FDatabaseUsersItem(
            users:users)
        user.identifier = userId
        
        guard
            
            let location:FDatabaseUsersItemLocation = FDatabaseUsersItemLocation(
                user:user,
                country:country)
        
        else
        {
            return
        }
        
        let firebase:FDatabase = FDatabase()
        firebase.update(model:location)
        
        completion()
    }
    
    func firebaseCountryUser(
        latitude:Double,
        longitude:Double,
        country:String,
        completion:@escaping(() -> ()))
    {
        guard
            
            let userId:String = data?.userId
            
        else
        {
            return
        }
        
        let countries:FDatabaseCountries = FDatabaseCountries()
        let country:FDatabaseCountriesItem = FDatabaseCountriesItem(
            countries:countries,
            identifier:country)
        
        guard
            
            let user:FDatabaseCountriesItemUser = FDatabaseCountriesItemUser(
                country:country,
                identifier:userId,
                latitude:latitude,
                longitude:longitude)
            
        else
        {
            return
        }
        
        let firebase:FDatabase = FDatabase()
        firebase.update(model:user)
        
        completion()
    }
}
