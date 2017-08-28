import UIKit

class VProfileEditList:VCollection<
    VProfileEdit,
    MProfileEdit,
    CProfileEdit,
    VProfileEditListCell>
{
    required init(controller:CProfileEdit)
    {
        super.init(controller:controller)
        
        registerHeader(header:VProfileEditListHeader.self)
        registerCell(cell:VProfileEditListCellPictures.self)
        registerCell(cell:VProfileEditListCellName.self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
