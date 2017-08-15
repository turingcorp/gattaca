import Foundation

extension MSession
{
    //MARK: private
    
    private func sync(
        userId:String?,
        fireBase:FDatabase,
        users:FDatabaseUsers,
        completion:@escaping((FDatabaseUsersItem) -> ()))
    {
        if let userId:String = userId
        {
            loadFromFirebase(
                userId:userId,
                fireBase:fireBase,
                users:users,
                completion:completion)
        }
        else
        {
            createInFirebase(
                fireBase:fireBase,
                users:users,
                completion:completion)
        }
    }
    
    private func updateSyncstamp(
        fireBase:FDatabase,
        user:FDatabaseUsersItem,
        completion:@escaping((FDatabaseUsersItem) -> ()))
    {
        guard
            
            let syncstamp:FDatabaseUsersItemSyncstamp = FDatabaseUsersItemSyncstamp(
                user:user)
        
        else
        {
            return
        }
        
        fireBase.update(model:syncstamp)
        
        completion(user)
    }
    
    //MARK: internal
    
    func sync(
        coreData:Database,
        session:DSession,
        completion:@escaping(() -> ()))
    {
        let userId:String? = session.userId
        let fireBase:FDatabase = FDatabase()
        let users:FDatabaseUsers = FDatabaseUsers()
        
        sync(
            userId:userId,
            fireBase:fireBase,
            users:users)
        { (user:FDatabaseUsersItem) in
            
            session.userId = user.identifier
            session.rawStatus = user.status
            
            coreData.save
            {
                completion()
            }
        }
    }
    
    func loadFromFirebase(
        userId:String,
        fireBase:FDatabase,
        users:FDatabaseUsers,
        completion:@escaping((FDatabaseUsersItem) -> ()))
    {
        fireBase.load(
            parent:users,
            identifier:userId)
        { [weak self] (user:FDatabaseUsersItem?) in
            
            guard
                
                let user:FDatabaseUsersItem = user
                
            else
            {
                self?.createInFirebase(
                    fireBase:fireBase,
                    users:users,
                    completion:completion)
                
                return
            }
            
            self?.updateSyncstamp(
                fireBase:fireBase,
                user:user,
                completion:completion)
        }
    }
    
    func createInFirebase(
        fireBase:FDatabase,
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
        
        let userId:String = fireBase.create(
            parent:users,
            data:userJson)
        user.identifier = userId
        
        completion(user)
    }
}
