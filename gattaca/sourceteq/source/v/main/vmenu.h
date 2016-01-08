#import "appdel.h"

@class msection;

@interface vmenu:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

+(void)addto:(UIView*)view;

@property(strong, nonatomic)msection *sections;

@end