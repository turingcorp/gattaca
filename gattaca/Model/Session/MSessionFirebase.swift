import Foundation

extension MSession
{
    //MARK: private
    
    private func sync(
        userId:String?,
        database:FDatabase,
        users:FDatabaseUsers,
        completion:@escaping((FDatabaseUsersItem) -> ()))
    {
        if let userId:String = userId
        {
            loadFromFirebase(
                userId:userId,
                database:database,
                users:users,
                completion:completion)
        }
        else
        {
            createInFirebase(
                database:database,
                users:users,
                completion:completion)
        }
    }
    
    //MARK: internal
    
    func sync(
        manager:DManager,
        session:DSession,
        completion:@escaping(() -> ()))
    {
        let userId:String? = session.userId
        let database:FDatabase = FDatabase()
        let users:FDatabaseUsers = FDatabaseUsers()
        
        sync(
            userId:userId,
            database:database,
            users:users)
        { (user:FDatabaseUsersItem) in
            
            session.userId = user.identifier
            session.rawStatus = user.status
            
            manager.save
            {
                completion()
            }
        }
    }
    
    func loadFromFirebase(
        userId:String,
        database:FDatabase,
        users:FDatabaseUsers,
        completion:@escaping((FDatabaseUsersItem) -> ()))
    {
        database.load(
            parent:users,
            identifier:userId)
        { [weak self] (user:FDatabaseUsersItem?) in
            
            guard
                
                let user:FDatabaseUsersItem = user
                
            else
            {
                return
            }
            
            self?.updateFirebase(
                database:database,
                user:user,
                completion:completion)
        }
    }
    
    func updateFirebase(
        database:FDatabase,
        user:FDatabaseUsersItem,
        completion:@escaping((FDatabaseUsersItem) -> ()))
    {
        let syncstamp:FDatabaseUsersItemSyncstamp = FDatabaseUsersItemSyncstamp(
            user:user)
        database.update(model:syncstamp)
        
        completion(user)
    }
    
    func createInFirebase(
        database:FDatabase,
        users:FDatabaseUsers,
        completion:@escaping((FDatabaseUsersItem) -> ()))
    {
        let user:FDatabaseUsersItem = FDatabaseUsersItem(
            users:users)
        
        guard
            
            let userJson:Any = user.json
            
        else
        {
            return
        }
        
        let userId:String = database.create(
            parent:users,
            data:userJson)
        user.identifier = userId
        
        completion(user)
    }
}
