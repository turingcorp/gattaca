#import "appdel.h"

@class mprofilegender;
@class mprofilelike;
@class mprofileground;

@interface mprofile:NSObject

-(void)loadstats;
-(void)loadstats:(NSDictionary*)json;
-(void)changegender:(profile_gender)gender;

@property(strong, nonatomic)mprofilegender *gender;
@property(strong, nonatomic)mprofilelike *like;
@property(strong, nonatomic)mprofileground *ground;
@property(copy, nonatomic)NSString *name;
@property(nonatomic)NSInteger latitude;
@property(nonatomic)NSInteger longitude;
@property(nonatomic)NSInteger age;

@end