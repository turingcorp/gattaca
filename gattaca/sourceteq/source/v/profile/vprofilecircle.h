#import "appdel.h"

@class mprofile;

@interface vprofilecircle:UIView

-(instancetype)init:(mprofile*)profile;

@property(weak, nonatomic)mprofile *profile;

@end