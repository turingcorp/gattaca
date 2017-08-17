import Foundation

extension MSession
{
    //MARK: private
    
    private func sync(
        userId:String?,
        firebase:FDatabase,
        users:FDatabaseUsers,
        completion:@escaping((FDatabaseUsersItem) -> ()))
    {
        if let userId:String = userId
        {
            loadFromFirebase(
                userId:userId,
                firebase:firebase,
                users:users,
                completion:completion)
        }
        else
        {
            createInFirebase(
                firebase:firebase,
                users:users,
                completion:completion)
        }
    }
    
    private func updateSyncstamp(
        firebase:FDatabase,
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
        
        firebase.update(model:syncstamp)
        
        completion(user)
    }
    
    //MARK: internal
    
    func sync(
        coreData:Database,
        session:DSession,
        completion:@escaping(() -> ()))
    {
        let userId:String? = session.userId
        let firebase:FDatabase = FDatabase()
        let users:FDatabaseUsers = FDatabaseUsers()
        
        sync(
            userId:userId,
            firebase:firebase,
            users:users)
        { [weak self] (user:FDatabaseUsersItem) in
            
            session.userId = user.identifier
            session.rawStatus = user.status
            
            self?.updateSession(session:session)
            
            coreData.save
            {
                completion()
            }
        }
    }
    
    func loadFromFirebase(
        userId:String,
        firebase:FDatabase,
        users:FDatabaseUsers,
        completion:@escaping((FDatabaseUsersItem) -> ()))
    {
        firebase.load(
            parent:users,
            identifier:userId)
        { [weak self] (user:FDatabaseUsersItem?) in
            
            guard
                
                let user:FDatabaseUsersItem = user
                
            else
            {
                self?.createInFirebase(
                    firebase:firebase,
                    users:users,
                    completion:completion)
                
                return
            }
            
            self?.updateSyncstamp(
                firebase:firebase,
                user:user,
                completion:completion)
        }
    }
    
    func createInFirebase(
        firebase:FDatabase,
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
        
        let userId:String = firebase.create(
            parent:users,
            data:userJson)
        user.identifier = userId
        
        completion(user)
    }
}
