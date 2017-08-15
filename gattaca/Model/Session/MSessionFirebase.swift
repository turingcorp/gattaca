import Foundation

extension MSession
{
    //MARK: internal
    
    func sync(
        manager:DManager,
        session:DSession,
        completion:@escaping(() -> ()))
    {
        let database:FDatabase = FDatabase(bundle:nil)
        let users:FDatabaseUsers = FDatabaseUsers()
        
        guard
            
            let userId:String = session.userId
            
        else
        {
            createInFirebase(
                database:database,
                users:users,
                manager:manager,
                session:session,
                completion:completion)
            
            return
        }
        
        loadFromFirebase(
            userId:userId,
            database:database,
            users:users,
            manager:manager,
            session:session,
            completion:completion)
    }
    
    func loadFromFirebase(
        userId:String,
        database:FDatabase,
        users:FDatabaseUsers,
        manager:DManager,
        session:DSession,
        completion:@escaping(() -> ()))
    {
        database.load(
            parent:users,
            identifier:userId)
        { (user:FDatabaseUsersItem?) in
            
            guard
                
                let user:FDatabaseUsersItem = user
                
            else
            {
                return
            }
            
            session.rawStatus = user.status
            
            manager.save
            { [weak self] in
                
                self?.updateFirebase(
                    database:database,
                    user:user,
                    completion:completion)
            }
        }
    }
    
    func updateFirebase(
        database:FDatabase,
        user:FDatabaseUsersItem,
        completion:@escaping(() -> ()))
    {
        let syncstamp:FDatabaseUsersItemSyncstamp = FDatabaseUsersItemSyncstamp(
            user:user)
        database.update(model:syncstamp)
        
        completion()
    }
    
    func createInFirebase(
        database:FDatabase,
        users:FDatabaseUsers,
        manager:DManager,
        session:DSession,
        completion:@escaping(() -> ()))
    {
        let user:FDatabaseUsersItem = FDatabaseUsersItem(
            users:users,
            session:session)
        
        guard
            
            let userJson:Any = user.json
            
        else
        {
            return
        }
        
        let userId:String = database.create(
            parent:users,
            data:userJson)
        session.userId = userId
        
        manager.save
        {
            completion()
        }
    }
}
