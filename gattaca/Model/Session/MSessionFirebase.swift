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
        { (model:MFirebaseDUserItem?) in
            
            guard
                
                let model:MFirebaseDUserItem = model
                
            else
            {
                return
            }
            
            session.rawStatus = model.status
            
            manager.save
            {
                    
            }
        }
    }
    
//    func updateFirebase(
//        userId:String,)
    
    func createInFirebase(
        database:MFirebaseDManager,
        userList:MFirebaseDUser,
        manager:DManager,
        session:DSession,
        completion:@escaping(() -> ()))
    {
        let user:MFirebaseDUserItem = MFirebaseDUserItem(
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
