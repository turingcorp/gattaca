import Foundation

class Model<S:ViewMain>
{
    weak var view:S?
    private(set) weak var session:MSession!
    
    required init(session:MSession)
    {
        self.session = session
    }
}
