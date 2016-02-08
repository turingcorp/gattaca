#import "appdel.h"
#import "viewbase.h"

@class mmyprofileages;

@interface vconfigprofileage:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mmyprofileages *ages;
@property(weak, nonatomic)mmyprofileage *current;
@property(weak, nonatomic)UICollectionView *collection;

@end