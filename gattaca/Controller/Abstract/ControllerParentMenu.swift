import UIKit

extension ControllerParent
{
    //MARK: internal
    
    func menuSelected(item:MMenuItemProtocol)
    {
        let order:MMenu.Order = item.order
        let current:MMenu.Order = menu.selected
        menu.selected = order
        
        if order.rawValue == current.rawValue
        {
            return
        }
        
        let direction:ControllerParent.Horizontal
        
        if order.rawValue > current.rawValue
        {
            direction = ControllerParent.Horizontal.right
        }
        else
        {
            direction = ControllerParent.Horizontal.left
        }
        
//        print(item.controller)
    }
}
