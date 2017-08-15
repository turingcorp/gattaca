import Foundation

extension MSession
{
    //MARK: internal
    
    func load(
        manager:DManager,
        completion:@escaping((DSession) -> ()))
    {
        manager.fetch
        { [weak self] (data:[DSession]) in
            
            guard
                
                let session:DSession = data.first
                
            else
            {
                self?.create(
                    manager:manager,
                    completion:completion)
                
                return
            }
            
            completion(session)
        }
    }
    
    func create(
        manager:DManager,
        completion:@escaping((DSession) -> ()))
    {
        manager.create
        { (session:DSession) in
            
            manager.save
            {
                completion(session)
            }
        }
    }
    
    func sync(
        manager:DManager,
        session:DSession,
        completion:@escaping(() -> ()))
    {
        guard
        
            let userId:String = session.userId
        
        else
        {
            createInFirebase(
                manager:manager,
                session:session,
                completion:completion)
            
            return
        }
        
        loadFromFirebase(
            userId:userId,
            manager:manager,
            session:session,
            completion:completion)
    }
    
    func loadFromFirebase(
        userId:String,
        manager:DManager,
        session:DSession,
        completion:@escaping(() -> ()))
    {
        let database:MFirebaseDManager = MFirebaseDManager(bundle:nil)
        let userList:MFirebaseDUser = MFirebaseDUser()
        
        database.load(
            parent:userList,
            identifier:nil)
        { (model:MFirebaseDUserItem?) in
            
        }
    }
    
    func createInFirebase(
        manager:DManager,
        session:DSession,
        completion:@escaping(() -> ()))
    {
        let database:MFirebaseDManager = MFirebaseDManager(bundle:nil)
        let userList:MFirebaseDUser = MFirebaseDUser()
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
