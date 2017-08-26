import Foundation

class CProfileEdit:Controller<VProfileEdit, MProfileEdit>
{
    //MARK: private
    
    private func back()
    {
        parentController?.pop(
            vertical:ControllerParent.Vertical.bottom)
    }
    
    //MARK: internal
    
    func done()
    {
        back()
    }
}
