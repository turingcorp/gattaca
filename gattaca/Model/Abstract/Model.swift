import Foundation

class Model
{
    weak var delegate:ModelDelegate?
    private(set) weak var session:MSession!
    
    required init(session:MSession)
    {
        self.session = session
    }
}
