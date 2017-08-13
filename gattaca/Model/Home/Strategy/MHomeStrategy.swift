import Foundation

class MHomeStrategy
{
    private(set) weak var controller:CHome!
    
    required init(controller:CHome)
    {
        self.controller = controller
    }
    
    //MARK: internal
    
    func nextStep()
    {
    }
}
