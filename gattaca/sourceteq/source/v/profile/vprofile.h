#import "appdel.h"

@class mprofile;

@interface vprofile:UIView

+(UIColor*)colorforgender:(profile_gender)gender;
-(instancetype)init:(mprofile*)profile;
-(void)reload;

@property(weak, nonatomic)mprofile *profile;

@end