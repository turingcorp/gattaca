#import "appdel.h"
#import "viewbase.h"

@class mmyprofileages;

@interface vprofileage:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mmyprofileages *ages;

@end