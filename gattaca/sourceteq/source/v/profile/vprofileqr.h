#import "appdel.h"

@class mprofile;

@interface vprofileqr:UIView

-(instancetype)init:(mprofile*)profile;
-(void)reload;

@property(weak, nonatomic)mprofile *profile;
@property(weak, nonatomic)UIImageView *image;

@end