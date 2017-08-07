import Foundation

class MHome:Model
{
    var selected:Int
    let menu:[MHomeMenuProtocol]
    private(set) var items:[MHomeItem]
    
    required init()
    {
        selected = 0
        items = []
        menu = MHome.factoryMenu()
        
        super.init()
    }
    
    //MARK: internal
    
    func itemsLoaded(items:[MHomeItem])
    {
        self.items = items
        
        let count:Int = items.count
        
        if count == 0
        {
            selected = 0
        }
        else
        {
            if selected >= count
            {
                selected = count - 1
            }
        }
        
        delegate?.modelRefresh()
    }
    
    func currentItem() -> MHomeItem?
    {
        if selected < items.count
        {
            let item:MHomeItem = items[selected]
            
            return item
        }
        
        return nil
    }
    
    func moveRight() -> Bool
    {
        if selected < items.count - 1
        {
            selected += 1
            
            return true
        }
        
        return false
    }
    
    func moveLeft() -> Bool
    {
        if selected > 0
        {
            selected -= 1
            
            return true
        }
        
        return false
    }
}
