#import "appdel.h"

@class mprofile;
@class vprofileqr;
@class vprofilename;

@interface vprofile:UIView

+(UIColor*)colorforgender:(profile_gender)gender;
-(instancetype)init:(mprofile*)profile;
-(void)reload;

@property(weak, nonatomic)mprofile *profile;
@property(weak, nonatomic)vprofileqr *qr;
@property(weak, nonatomic)vprofilename *name;

@end