import UIKit

extension VMenu:
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
{
    //MARK: internal
    
    func factoryCollection()
    {
        
    }
    
    //MARK: collectionViewDelegate
    
    func numberOfSections(
        in collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = controller.menu.items.count
        
        return count
    }
    
    func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let cell:VMenuCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            VMenuCell.reusableIdentifier,
            for:indexPath) as! VMenuCell
        
        return cell
    }
}
