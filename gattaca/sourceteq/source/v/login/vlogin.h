#import "appdel.h"
#import "viewbase.h"

@class mlogin;

@interface vlogin:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mlogin *model;
@property(weak, nonatomic)UICollectionView *steps;
@property(weak, nonatomic)UICollectionView *indicators;

@end