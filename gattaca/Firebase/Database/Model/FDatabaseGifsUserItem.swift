import Foundation

class FDatabaseGifsUserItem:FDatabaseProtocol
{
    var identifier:String?
    var parent:FDatabaseProtocol?
    let mark:DGif.Mark
    
    init(
        user:FDatabaseGifsUser,
        identifier:String,
        mark:DGif.Mark)
    {
        self.identifier = identifier
        self.mark = mark
        parent = user
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
