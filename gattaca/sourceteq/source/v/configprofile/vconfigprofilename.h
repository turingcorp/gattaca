#import "appdel.h"
#import "viewbase.h"

@class mmyprofilenames;

@interface vconfigprofilename:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mmyprofilenames *model;

@end