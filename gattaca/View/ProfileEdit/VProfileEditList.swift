import UIKit

class VProfileEditList:VCollection<
    VProfileEdit,
    MProfileEdit,
    CProfileEdit,
    VProfileEditListCell>
{
    private let headerSize:CGSize
    private let kHeaderHeight:CGFloat = 40
    
    required init(controller:CProfileEdit)
    {
        headerSize = CGSize(width:0, height:kHeaderHeight)
        
        super.init(controller:controller)
        
        registerHeader(header:VProfileEditListHeader.self)
        registerCell(cell:VProfileEditListCellPictures.self)
        registerCell(cell:VProfileEditListCellName.self)
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
        let item:MProfileEditItemProtocol = modelAtIndex(index:section)
        
        if item.headerTitle == nil
        {
            return CGSize.zero
        }
        
        return headerSize
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
    
    //MARK: private
    
    private func modelAtIndex(index:Int) -> MProfileEditItemProtocol
    {
        let item:MProfileEditItemProtocol = controller.model.items[index]
        
        return item
    }
}
