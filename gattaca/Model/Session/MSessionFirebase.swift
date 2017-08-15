import Foundation

extension MSession
{
    //MARK: internal
    
    func sync(
        manager:DManager,
        session:DSession,
        completion:@escaping(() -> ()))
    {
        let database:MFirebaseDManager = MFirebaseDManager(bundle:nil)
        let userList:MFirebaseDUser = MFirebaseDUser()
        
        guard
            
            let userId:String = session.userId
            
        else
        {
            createInFirebase(
                database:database,
                userList:userList,
                manager:manager,
                session:session,
                completion:completion)
            
            return
        }
        
        loadFromFirebase(
            userId:userId,
            database:database,
            userList:userList,
            manager:manager,
            session:session,
            completion:completion)
    }
    
    func loadFromFirebase(
        userId:String,
        database:MFirebaseDManager,
        userList:MFirebaseDUser,
        manager:DManager,
        session:DSession,
        completion:@escaping(() -> ()))
    {
        database.load(
            parent:userList,
            identifier:userId)
        { (user:MFirebaseDUserItem?) in
            
            guard
                
                let user:MFirebaseDUserItem = user
                
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
        database:MFirebaseDManager,
        user:MFirebaseDUserItem,
        completion:@escaping(() -> ()))
    {
        let syncstamp:MFirebaseDUserItemSyncstamp = MFirebaseDUserItemSyncstamp(
            parent:user)
        database.update(model:syncstamp)
        
        completion()
    }
    
    func createInFirebase(
        database:MFirebaseDManager,
        userList:MFirebaseDUser,
        manager:DManager,
        session:DSession,
        completion:@escaping(() -> ()))
    {
        let user:MFirebaseDUserItem = MFirebaseDUserItem(
            parent:userList,
            session:session)
        
        guard
            
            let userJson:Any = user.json
            
        else
        {
            return
        }
        
        let userId:String = database.create(
            parent:userList,
            data:userJson)
        session.userId = userId
        
        manager.save
        {
            completion()
        }
    }
}
