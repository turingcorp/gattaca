import XCTest
@testable import gattaca

class TMSessionLocation:XCTestCase
{
    private var coreData:Database?
    private let kUserId:String = "johnnyTest"
    private let kCountry:String = "bananaRepublic"
    private let kOtherCountry:String = "coffeeRepublic"
    private let kLatitude:Double = 1
    private let kLongitude:Double = 2
    private let kWaitExpectation:TimeInterval = 3
    
    override func setUp()
    {
        super.setUp()
        
        let bundle:Bundle = Bundle(for:TMSessionLocation.self)
        coreData = Database(bundle:bundle)
    }
    
    //MARK: private
    
    private func createUser(session:MSession)
    {
        session.userId = kUserId
        session.country = kCountry
        session.status = DSession.Status.active
    }
    
    private func createUserCoreData(
        session:MSession,
        completion:@escaping(() -> ()))
    {
        guard
            
            let coreData:Database = self.coreData
            
        else
        {
            return
        }
        
        coreData.create
        { [weak self] (user:DSession) in
            
            user.initialValues()
            user.userId = self?.kUserId
            user.country = self?.kCountry
            session.updateSession(session:user)
            
            completion()
        }
    }
    
    private func addLocation(
        session:MSession,
        firebase:FDatabase,
        completion:@escaping(() -> ()))
    {
        let countries:FDatabaseCountries = FDatabaseCountries()
        let country:FDatabaseCountriesItem = FDatabaseCountriesItem(
            countries:countries,
            identifier:kCountry)
        
        guard
            
            let userId:String = session.userId,
            let user:FDatabaseCountriesItemUser = FDatabaseCountriesItemUser(
                country:country,
                identifier:userId,
                latitude:kLatitude,
                longitude:kLongitude)
            
        else
        {
            return
        }
        
        firebase.update(model:user)
        
        completion()
    }
    
    private func getCountryUser(
        userId:String,
        country:String,
        firebase:FDatabase,
        completion:@escaping((FDatabaseCountriesItemUser?) -> ()))
    {
        let countries:FDatabaseCountries = FDatabaseCountries()
        let country:FDatabaseCountriesItem = FDatabaseCountriesItem(
            countries:countries,
            identifier:country)
        
        firebase.load(parent:country, identifier:userId)
        { (user:FDatabaseCountriesItemUser?) in
            
            completion(user)
        }
    }
    
    private func getUserLocation(
        userId:String,
        firebase:FDatabase,
        completion:@escaping((FDatabaseUsersItemLocation?) -> ()))
    {
        let users:FDatabaseUsers = FDatabaseUsers()
        let user:FDatabaseUsersItem = FDatabaseUsersItem(
            users:users)
        user.identifier = userId
        
        firebase.load(
            parent:user,
            identifier:FDatabaseUsersItem.kKeyLocation)
        { (location:FDatabaseUsersItemLocation?) in
            
            completion(location)
        }
    }
    
    private func createUserAtLocation(
        completion:@escaping((MSession, FDatabase) -> ()))
    {
        let session:MSession = MSession()
        let firebase:FDatabase = FDatabase()
        
        createUser(session:session)
        
        addLocation(
            session:session,
            firebase:firebase)
        {
            completion(session, firebase)
        }
    }
    
    private func createFirebaseUser(
        session:MSession,
        firebase:FDatabase)
    {
        let users:FDatabaseUsers = FDatabaseUsers()
        let user:FDatabaseUsersItem = FDatabaseUsersItem(
            users:users)
        
        guard
            
            let userJson:Any = user.json
        
        else
        {
            return
        }
        
        let userId:String = firebase.create(
            parent:users,
            data:userJson)
        
        session.userId = userId
    }
    
    //MARK: internal
    
    func testSyncLocation()
    {
        guard
            
            let coreData:Database = self.coreData
            
        else
        {
            return
        }
        
        let syncExpectation:XCTestExpectation = expectation(
            description:"sync location")
        
        let session:MSession = MSession()
        session.syncLocation(
            coreData:coreData,
            latitude:kLatitude,
            longitude:kLongitude,
            country:kCountry)
        {
            syncExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertNotNil(
                session.country,
                "location not syncing")
        }
    }
    
    func testRemovePreviousLocationDifferent()
    {
        var firebaseCountryUser:FDatabaseCountriesItemUser?
        let firstCountry:String = kCountry
        let newCountry:String = kOtherCountry
        
        let removeExpectation:XCTestExpectation = expectation(
            description:"remove user from country")
        
        createUserAtLocation
        { [weak self] (session:MSession, firebase:FDatabase) in
            
            guard
            
                let userId:String = session.userId
            
            else
            {
                return
            }
            
            session.removePreviousLocation(
                newCountry:newCountry,
                firebase:firebase)
            
            self?.getCountryUser(
                userId:userId,
                country:firstCountry,
                firebase:firebase)
            { (countryUser:FDatabaseCountriesItemUser?) in
                
                firebaseCountryUser = countryUser
                
                removeExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertNil(
                firebaseCountryUser,
                "country user should be nil")
        }
    }
    
    func testRemovePreviousLocationSame()
    {
        var firebaseCountryUser:FDatabaseCountriesItemUser?
        let country:String = kCountry
        
        let removeExpectation:XCTestExpectation = expectation(
            description:"remove user from country")
        
        createUserAtLocation
        { [weak self] (session:MSession, firebase:FDatabase) in
                
            guard
                
                let userId:String = session.userId
                
            else
            {
                return
            }
            
            session.removePreviousLocation(
                newCountry:country,
                firebase:firebase)
            
            self?.getCountryUser(
                userId:userId,
                country:country,
                firebase:firebase)
            { (countryUser:FDatabaseCountriesItemUser?) in
                
                firebaseCountryUser = countryUser
                
                removeExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertNotNil(
                firebaseCountryUser,
                "country user should not be removed")
        }
    }
    
    func testCoreDataLocation()
    {
        let session:MSession = MSession()
        let newCountry:String = kOtherCountry

        let updateExpectation:XCTestExpectation = expectation(
            description:"update coreData location")
        
        createUserCoreData(session:session)
        {
            XCTAssertNotNil(
                session.country,
                "failed creating data")
            
            guard
                
                let coreData:Database = self.coreData
                
            else
            {
                return
            }
            
            session.coreDataLocation(
                country:newCountry,
                coreData:coreData)
            {
                updateExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertEqual(
                session.country,
                newCountry,
                "failed updating country")
        }
    }
    
    func testFirebaseUserLocation()
    {
        var userLocation:FDatabaseUsersItemLocation?
        let session:MSession = MSession()
        let firebase:FDatabase = FDatabase()
        
        let updateExpectation:XCTestExpectation = expectation(
            description:"update firebase user location")
        
        createFirebaseUser(
            session:session,
            firebase:firebase)
        
        XCTAssertNotNil(
            session.userId,
            "failed creating user")
        
        guard
            
            let userId:String = session.userId
        
        else
        {
            return
        }
        
        session.firebaseUserLocation(
            country:kCountry,
            firebase:firebase)
        { [weak self] in
            
            self?.getUserLocation(
                userId:userId,
                firebase:firebase)
            { (location:FDatabaseUsersItemLocation?) in
                
                userLocation = location
                updateExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { [weak self] (error:Error?) in
            
            XCTAssertNotNil(
                userLocation,
                "failed updating location")
            
            XCTAssertEqual(
                userLocation?.country,
                self?.kCountry,
                "country location mismatch")
        }
    }
    
    func testFirebaseCountryUser()
    {
        var countryUser:FDatabaseCountriesItemUser?
        let session:MSession = MSession()
        let firebase:FDatabase = FDatabase()
        let country:String = kCountry
        
        let updateExpectation:XCTestExpectation = expectation(
            description:"update firebase country user")
        
        createUser(session:session)
        
        XCTAssertNotNil(
            session.userId,
            "failed creating user")
        
        guard
            
            let userId:String = session.userId
        
        else
        {
            return
        }
        
        session.firebaseCountryUser(
            latitude:kLatitude,
            longitude:kLongitude,
            country:country,
            firebase:firebase)
        { [weak self] in
            
            self?.getCountryUser(
                userId:userId,
                country:country,
                firebase:firebase)
            { (user:FDatabaseCountriesItemUser?) in
                
                countryUser = user
                updateExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { [weak self] (error:Error?) in

            XCTAssertNotNil(
                countryUser,
                "failed updating country user")
            
            XCTAssertEqual(
                countryUser?.latitude,
                self?.kLatitude,
                "latitude mismatch")
            
            XCTAssertEqual(
                countryUser?.longitude,
                self?.kLongitude,
                "longitude mismatch")
        }
    }
}
