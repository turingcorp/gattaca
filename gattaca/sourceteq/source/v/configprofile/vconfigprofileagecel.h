#import "appdel.h"

@class mmyprofileage;

@interface vconfigprofileagecel:UICollectionViewCell

-(void)config:(mmyprofileage*)age;

@property(weak, nonatomic)UILabel *lbl;

@end