import UIKit

class VHomeActions:VCollection<
    VHome,
    MHome,
    CHome,
    VHomeActionsCell>
{
    private var cellSize:CGSize?
    private let kCellWidth:CGFloat = 85
    
    required init(controller:CHome)
    {
        super.init(controller:controller)
        collectionView.bounces = false
        collectionView.isScrollEnabled = false
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.scrollDirection = UICollectionViewScrollDirection.horizontal
        }
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        layout collectionViewLayout:UICollectionViewLayout,
        insetForSectionAt section:Int) -> UIEdgeInsets
    {
        let width:CGFloat = collectionView.bounds.width
        let count:CGFloat = CGFloat(controller.model.actions.count)
        let cellsWidth:CGFloat = kCellWidth * count
        let remainWidth:CGFloat = width - cellsWidth
        let margin:CGFloat = remainWidth / 2.0
        let insets:UIEdgeInsets = UIEdgeInsets(
            top:0,
            left:margin,
            bottom:0,
            right:margin)
        
        return insets
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        layout collectionViewLayout:UICollectionViewLayout,
        sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        guard
        
            let cellSize:CGSize = self.cellSize
        
        else
        {
            let height:CGFloat = collectionView.bounds.height
            let cellSize:CGSize = CGSize(width:kCellWidth, height:height)
            self.cellSize = cellSize
            
            return cellSize
        }
        
        return cellSize
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = controller.model.actions.count
        
        return count
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MHomeActionProtocol = modelAtIndex(index:indexPath)
        let cell:VHomeActionsCell = cellAtIndex(indexPath:indexPath)
        cell.config(model:item)
        
        return cell
    }
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> MHomeActionProtocol
    {
        let item:MHomeActionProtocol = controller.model.actions[index.item]
        
        return item
    }
}
