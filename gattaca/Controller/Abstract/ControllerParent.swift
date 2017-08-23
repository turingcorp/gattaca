import UIKit

class ControllerParent:UIViewController
{
    var orientation:UIInterfaceOrientationMask
    private let session:MSession
    
    init()
    {
        session = MSession()
        orientation = UIInterfaceOrientationMask.portrait
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let controller:CHome = CHome(session:session)
        mainController(controller:controller)
    }
    
    override func loadView()
    {
        let viewParent:ViewParent = ViewParent(controller:self)
        view = viewParent
    }
}
