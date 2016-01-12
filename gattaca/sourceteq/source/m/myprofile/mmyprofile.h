#import "appdel.h"

@interface mmyprofile:NSObject

+(instancetype)singleton;
-(void)loaduser;

@property(copy, nonatomic)NSString *namestr;
@property(nonatomic)profile_name nametype;
@property(nonatomic)NSInteger latitude;
@property(nonatomic)NSInteger longitude;
@property(nonatomic)NSInteger age;
@property(nonatomic)BOOL coordsactive;

@end