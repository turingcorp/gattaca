#import "appdel.h"
#import "viewbase.h"

@interface vconfigsettings:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)UICollectionView *collection;

@end