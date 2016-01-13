#import "appdel.h"

@class mprofilelike;
@class mprofileground;

@interface mprofile:NSObject

-(instancetype)init:(NSDictionary*)json;
-(void)loadstats;
-(void)loadstats:(NSDictionary*)json;

@property(strong, nonatomic)mprofilelike *like;
@property(strong, nonatomic)mprofileground *ground;
@property(copy, nonatomic)NSString *name;
@property(nonatomic)profile_gender gender;
@property(nonatomic)NSInteger latitude;
@property(nonatomic)NSInteger longitude;
@property(nonatomic)NSInteger age;

@end