#import "appdel.h"

@class mlogin;

@interface vlogin:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(UIViewController*)controller;

@property(strong, nonatomic)mlogin *model;
@property(weak, nonatomic)UIViewController *controller;
@property(weak, nonatomic)UICollectionView *steps;
@property(weak, nonatomic)UICollectionView *indicators;

@end