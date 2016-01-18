#import "appdel.h"

@class mprofile;
@class vprofilecircleribbon;
@class vprofilecirclelike;
@class vprofilecircleground;
@class vprofilecircleage;

@interface vprofilecircle:UIView

-(instancetype)init:(mprofile*)profile;

@property(weak, nonatomic)mprofile *profile;
@property(weak, nonatomic)vprofilecircleribbon *ribbon;
@property(weak, nonatomic)vprofilecirclelike *like;
@property(weak, nonatomic)vprofilecircleground *ground;
@property(weak, nonatomic)vprofilecircleage *age;

@end