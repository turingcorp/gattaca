#import "appdel.h"
#import "viewbase.h"

@interface vgattacatester:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(void)load:(mgattacateststep*)step;

@property(weak, nonatomic)mgattacateststep *step;
@property(weak, nonatomic)UICollectionView *collection;

@end