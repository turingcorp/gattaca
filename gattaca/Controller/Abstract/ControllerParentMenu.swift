import UIKit

extension ControllerParent
{
    //MARK: private
    
    private func factoryDirection(item:MMenuItemProtocol) ->  ControllerParent.Horizontal
    {
        let order:MMenu.Order = item.order
        let current:MMenu.Order = menu.selected
        let direction:ControllerParent.Horizontal
        
        if order.rawValue > current.rawValue
        {
            direction = ControllerParent.Horizontal.right
        }
        else
        {
            direction = ControllerParent.Horizontal.left
        }
        
        return direction
    }
    
    //MARK: internal
    
    func menuSelected(item:MMenuItemProtocol)
    {
        menu.selected = item.order
        
    }
}
