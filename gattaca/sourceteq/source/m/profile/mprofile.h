#import "appdel.h"

@class mprofilelike;

@interface mprofile:NSObject

-(instancetype)init:(NSDictionary*)json;

@property(strong, nonatomic)mprofilelike *like;
@property(strong, nonatomic)mprofileground *ground;

@end