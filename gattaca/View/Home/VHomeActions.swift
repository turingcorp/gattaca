import UIKit

class VHomeActions:VCollection<
    VHome,
    MHome,
    CHome,
    VHomeActionsCell>
{
    private var cellSize:CGSize?
    private let kCellWidth:CGFloat = 85
    private let kShareWidth:CGFloat = 55
    
    required init(controller:CHome)
    {
        super.init(controller:controller)
        isHidden = true
        collectionView.bounces = false
        collectionView.isScrollEnabled = false
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.scrollDirection = UICollectionViewScrollDirection.horizontal
        }
        
        let viewShare:VHomeActionsShare = VHomeActionsShare(
            controller:controller)
        
        addSubview(viewShare)
        
        NSLayoutConstraint.equalsVertical(
            view:viewShare,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:viewShare,
            toView:self)
        NSLayoutConstraint.width(
            view:viewShare,
            constant:kShareWidth)
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
    
    override func collectionView(
        _ collectionView:UICollectionView,
        didSelectItemAt indexPath:IndexPath)
    {
        collectionView.isUserInteractionEnabled = false
        
        let item:MHomeActionProtocol = modelAtIndex(
            index:indexPath)
        controller.model.markCurrent(action:item)
    }
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> MHomeActionProtocol
    {
        let item:MHomeActionProtocol = controller.model.actions[index.item]
        
        return item
    }
    
    //MARK: internal
    
    func refresh()
    {
        if let _:MHomeItem = controller.model.items.first
        {
            isHidden = false
        }
        else
        {
            isHidden = true
        }
    }
}
