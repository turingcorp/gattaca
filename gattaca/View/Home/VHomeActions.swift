import UIKit

class VHomeActions:VCollection<
    VHome,
    MHome,
    CHome,
    VHomeActionsCell>
{
    private var cellSize:CGSize?
    private let kCellWidth:CGFloat = 80
    
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
        numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = controller.model.actions.count
        
        return count count
    }
}
