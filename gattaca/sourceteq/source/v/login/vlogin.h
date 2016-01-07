#import "appdel.h"

@class mlogin;

@interface vlogin:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mlogin *model;
@property(weak, nonatomic)UICollectionView *tutorial;
@property(weak, nonatomic)UICollectionView *indicators;

@end