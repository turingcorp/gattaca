#import "appdel.h"

@class mprofile;

@interface vprofilecircle:UIView

-(instancetype)init:(mprofile*)profile;
-(void)reload;

@property(weak, nonatomic)mprofile *profile;

@end