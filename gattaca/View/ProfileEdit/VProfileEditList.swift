import UIKit

class VProfileEditList:VCollection<
    VProfileEdit,
    MProfileEdit,
    CProfileEdit,
    VProfileEditListCell>
{
    private let headerSize:CGSize
    private let kHeaderHeight:CGFloat = 70
    
    required init(controller:CProfileEdit)
    {
        headerSize = CGSize(width:0, height:kHeaderHeight)
        
        super.init(controller:controller)
        
        collectionView.alwaysBounceVertical = true
        registerHeader(header:VProfileEditListHeader.self)
        registerCell(cell:VProfileEditListCellPictures.self)
        registerCell(cell:VProfileEditListCellName.self)
        registerCell(cell:VProfileEditListCellAge.self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        layout collectionViewLayout:UICollectionViewLayout,
        referenceSizeForHeaderInSection section:Int) -> CGSize
    {
        let item:MProfileEditItemProtocol = modelAtIndex(
            index:section)
        
        if item.headerTitle == nil
        {
            return CGSize.zero
        }
        
        return headerSize
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        layout collectionViewLayout:UICollectionViewLayout,
        sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        let width:CGFloat = collectionView.bounds.width
        let item:MProfileEditItemProtocol = modelAtIndex(
            index:indexPath.section)
        let size:CGSize = CGSize(
            width:width,
            height:item.height)
        
        return size
    }
    
    override func numberOfSections(
        in collectionView:UICollectionView) -> Int
    {
        let count:Int = controller.model.items.count
        
        return count
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        numberOfItemsInSection section:Int) -> Int
    {
        return 1
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        viewForSupplementaryElementOfKind kind:String,
        at indexPath:IndexPath) -> UICollectionReusableView
    {
        let item:MProfileEditItemProtocol = modelAtIndex(
            index:indexPath.section)
        let header:VProfileEditListHeader = reusableAtIndex(
            kind:kind,
            type:VProfileEditListHeader.self,
            indexPath:indexPath)
        header.config(model:item)
        
        return header
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MProfileEditItemProtocol = modelAtIndex(
            index:indexPath.section)
        let cell:VProfileEditListCell = cellAtIndex(
            reusableIdentifier:
            item.reusableIdentifier,
            indexPath:indexPath)
        cell.config(model:item, controller:controller)
        
        return cell
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        shouldSelectItemAt indexPath:IndexPath) -> Bool
    {
        return false
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        shouldHighlightItemAt indexPath:IndexPath) -> Bool
    {
        return false
    }
    
    //MARK: private
    
    private func modelAtIndex(index:Int) -> MProfileEditItemProtocol
    {
        let item:MProfileEditItemProtocol = controller.model.items[index]
        
        return item
    }
}
