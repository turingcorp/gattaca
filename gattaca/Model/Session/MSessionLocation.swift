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
        coreData:Database,
        latitude:Double,
        longitude:Double,
        country:String,
        completion:@escaping(() -> ()))
    {
        let firebase:FDatabase = FDatabase()
        
        removePreviousLocation(
            newCountry:country,
            firebase:firebase)
        
        coreDataLocation(
            country:country,
            coreData:coreData)
        { [weak self] in
            
            self?.firebaseUserLocation(
                country:country,
                firebase:firebase)
            { [weak self] in
                
                self?.firebaseCountryUser(
                    latitude:latitude,
                    longitude:longitude,
                    country:country,
                    firebase:firebase,
                    completion:completion)
            }
        }
    }
    
    func removePreviousLocation(
        newCountry:String,
        firebase:FDatabase)
    {
        guard
        
            let country:String = country,
            let userId:String = userId
        
        else
        {
            return
        }
        
        if country != newCountry
        {
            removeCountryUser(
                country:country,
                userId:userId,
                firebase:firebase)
        }
    }
    
    func coreDataLocation(
        country:String,
        coreData:Database,
        completion:@escaping(() -> ()))
    {
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
            
            coreData.save(completion:completion)
        }
    }
    
    func firebaseUserLocation(
        country:String,
        firebase:FDatabase,
        completion:@escaping(() -> ()))
    {
        guard
            
            let userId:String = userId
        
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
            
            let userId:String = userId
            
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
