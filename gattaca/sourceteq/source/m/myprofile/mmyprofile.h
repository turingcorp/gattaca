#import "appdel.h"

@interface mmyprofile:NSObject

+(instancetype)singleton;
-(void)loaduser;
-(void)updatename:(NSString*)newname;
-(void)changenameto:(profile_name)nametype name:(NSString*)newname;

@property(copy, nonatomic)NSString *namestr;
@property(nonatomic)profile_name nametype;
@property(nonatomic)NSInteger latitude;
@property(nonatomic)NSInteger longitude;
@property(nonatomic)NSInteger age;
@property(nonatomic)BOOL coordsactive;

@end