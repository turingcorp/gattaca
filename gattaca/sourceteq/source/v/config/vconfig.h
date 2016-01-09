#import "appdel.h"
#import "viewbase.h"

@class mconfig;
@class cconfigmain;

@interface vconfig:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(void)refresh;

@property(strong, nonatomic)mconfig *model;
@property(weak, nonatomic)cconfigmain *controller;
@property(weak, nonatomic)UICollectionView *collection;

@end