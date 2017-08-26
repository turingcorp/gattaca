import UIKit

class CProfile:Controller<VProfile, MProfile>
{
    override var preferredStatusBarStyle:UIStatusBarStyle
    {
        get
        {
            return UIStatusBarStyle.lightContent
        }
    }
    
    //MARK: internal
    
    func editProfile()
    {
        let controller:CProfileEdit = CProfileEdit(
            session:model.session)
        parentController?.push(
            controller:controller,
            vertical:ControllerParent.Vertical.bottom)
    }
}
