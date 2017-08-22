import Foundation

class FDatabaseGifsUser:FDatabaseProtocol
{
    var identifier:String?
    var parent:FDatabaseProtocol?
    let users:[FDatabaseCountriesItemUser]
    
    init(
        gifs:FDatabaseGifs,
        identifier:String)
    {
        self.identifier = identifier
        parent = gifs
        users = []
    }
    
    required init?(json:Any)
    {
        guard
            
            let rawUsers:[String:Any] = json as? [String:AnyObject]
            
            else
        {
            return nil
        }
        
        var users:[FDatabaseCountriesItemUser] = []
        let usersIds:[String] = Array(rawUsers.keys)
        
        for userId:String in usersIds
        {
            guard
                
                let rawUser:Any = rawUsers[userId],
                let user:FDatabaseCountriesItemUser = FDatabaseCountriesItemUser(
                    json:rawUser)
                
                else
            {
                continue
            }
            
            user.identifier = userId
            users.append(user)
        }
        
        self.users = users
    }
}
