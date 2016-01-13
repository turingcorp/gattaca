#import "appdel.h"

@class mprofile;
@class vprofilecirclelike;
@class vprofilecircleground;

@interface vprofilecircle:UIView

-(instancetype)init:(mprofile*)profile;

@property(weak, nonatomic)mprofile *profile;
@property(weak, nonatomic)vprofilecirclelike *like;
@property(weak, nonatomic)vprofilecircleground *ground;

@end