import XCTest
@testable import gattaca

class TMSessionLocation:XCTestCase
{
    private let kCountry:String = "banana republic"
    private let kOtherCountry:String = "coffee republic"
    private let kLatitude:Double = 1
    private let kLongitude:Double = 2
    private let kWaitExpectation:TimeInterval = 15
    
    //MARK: private
    
    private func createUser(
        session:MSession,
        completion:@escaping(() -> ()))
    {
        session.load
        {
            XCTAssertEqual(
                session.status,
                MSession.Status.loaded,
                "user not loaded")
            
            XCTAssertNotNil(
                session.data?.userId,
                "missing user id")
            
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
            
            let userId:String = session.data?.userId,
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
    
    private func getUser(
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
    
    private func createUserAtLocation(
        completion:@escaping((MSession, FDatabase) -> ()))
    {
        let session:MSession = MSession()
        let firebase:FDatabase = FDatabase()
        
        createUser(session:session)
        { [weak self] in
            
            self?.addLocation(
                session:session,
                firebase:firebase)
            {
                completion(session, firebase)
            }
        }
    }
    
    private func changeLocation(session:MSession)
    {
        let oldData:MSessionData? = session.data
        
        XCTAssertNotNil(
            oldData,
            "missing session data")
        
        let newData:MSessionData = MSessionData(
            userId:oldData?.userId,
            country:kOtherCountry,
            status:DSession.Status.active)
        
        session.data = newData
    }
    
    //MARK: internal
    
    func testSyncLocation()
    {
        let syncExpectation:XCTestExpectation = expectation(
            description:"sync location")
        
        let session:MSession = MSession()
        session.syncLocation(
            latitude:kLatitude,
            longitude:kLongitude,
            country:kCountry)
        {
            syncExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertEqual(
                session.status,
                MSession.Status.ready,
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
            
                let userId:String = session.data?.userId
            
            else
            {
                return
            }
            
            self?.changeLocation(session:session)
            
            XCTAssertEqual(
                session.data?.country,
                newCountry,
                "failed changing location")
            
            self?.getUser(
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
}
