#import "appdel.h"
#import "mprofilelikeprotocol.h"

@interface mprofilelike:NSObject

-(instancetype)init:(NSDictionary*)json;
-(NSInteger)count;
-(id<mprofilelikeprotocol>)item:(NSInteger)index;

@end