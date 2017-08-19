import Foundation

extension MSession
{
    //MARK: private
    
    private func removeCountryUser(
        country:String,
        userId:String,
        firebase:FDatabase)
    {
        let countries:FDatabaseCountries = FDatabaseCountries()
        let country:FDatabaseCountriesItem = FDatabaseCountriesItem(
            countries:countries,
            identifier:country)
        
        firebase.remove(parent:country, identifier:userId)
    }
    
    //MARK: internal
    
    func syncLocation(
        latitude:Double,
        longitude:Double,
        country:String,
        completion:@escaping(() -> ()))
    {
        let firebase:FDatabase = FDatabase()
        
        status = MSession.Status.syncLocation
        removePreviousLocation(
            oldCountry:country,
            firebase:firebase)
        
        addNewLocation(
            latitude:latitude,
            longitude:longitude,
            country:country,
            firebase:firebase)
        { [weak self] in
            
            self?.status = MSession.Status.ready
            completion()
        }
    }
    
    func removePreviousLocation(
        oldCountry:String,
        firebase:FDatabase)
    {
        guard
        
            let storedCountry:String = data?.country,
            let userId:String = data?.userId
        
        else
        {
            return
        }
        
        if storedCountry != oldCountry
        {
            removeCountryUser(
                country:storedCountry,
                userId:userId,
                firebase:firebase)
        }
    }
    
    func addNewLocation(
        latitude:Double,
        longitude:Double,
        country:String,
        firebase:FDatabase,
        completion:@escaping(() -> ()))
    {
        coreDataLocation(
            country:country)
        { [weak self] in
            
            self?.firebaseUserLocation(
                country:country,
                firebase:firebase)
            { [weak self] in
                
                self?.firebaseCountryUser(
                    latitude:latitude,
                    longitude:longitude,
                    country:country,
                    firebase:firebase)
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
        firebase:FDatabase,
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
        
        firebase.update(model:location)
        
        completion()
    }
    
    func firebaseCountryUser(
        latitude:Double,
        longitude:Double,
        country:String,
        firebase:FDatabase,
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
        
        firebase.update(model:user)
        
        completion()
    }
}
