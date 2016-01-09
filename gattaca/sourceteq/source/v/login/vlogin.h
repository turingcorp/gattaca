#import "appdel.h"

@class mlogin;
@class clogin;

@interface vlogin:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(clogin*)controller;

@property(strong, nonatomic)mlogin *model;
@property(weak, nonatomic)clogin *controller;
@property(weak, nonatomic)UICollectionView *steps;
@property(weak, nonatomic)UICollectionView *indicators;

@end