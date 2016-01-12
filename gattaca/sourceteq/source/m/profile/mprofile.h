#import "appdel.h"

@class mprofilelike;
@class mprofileground;

@interface mprofile:NSObject

-(instancetype)init:(NSDictionary*)json;

@property(strong, nonatomic)mprofilelike *like;
@property(strong, nonatomic)mprofileground *ground;

@end