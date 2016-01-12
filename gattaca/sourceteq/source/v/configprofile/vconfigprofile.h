#import "appdel.h"
#import "viewbase.h"

@interface vconfigprofile:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)UICollectionView *collection;

@end