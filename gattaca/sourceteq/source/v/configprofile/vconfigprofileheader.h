#import "appdel.h"

@class vprofile;

@interface vconfigprofileheader:UICollectionReusableView

-(void)reload;

@property(weak, nonatomic)vprofile *profile;

@end