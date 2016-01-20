#import "appdel.h"

@class mprofile;
@class vprofileqr;

@interface vprofile:UIView

+(UIColor*)colorforgender:(profile_gender)gender;
-(instancetype)init:(mprofile*)profile;
-(void)reload;

@property(weak, nonatomic)mprofile *profile;
@property(weak, nonatomic)vprofileqr *qr;

@end