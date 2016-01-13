#import "appdel.h"

@class mmyprofileage;

@interface vprofileagecel:UICollectionViewCell

-(void)config:(mmyprofileage*)age;

@property(weak, nonatomic)UILabel *lbl;

@end