#import "appdel.h"

@class mprofilegender;
@class mprofilecircle;

@interface mprofile:NSObject

-(void)loadstats;
-(void)loadstats:(NSDictionary*)json;
-(void)changegender:(profile_gender)gender;

@property(strong, nonatomic)mprofilegender *gender;
@property(strong, nonatomic)mprofilecircle *circle;
@property(copy, nonatomic)NSString *name;
@property(nonatomic)NSInteger latitude;
@property(nonatomic)NSInteger longitude;
@property(nonatomic)NSInteger age;

@end