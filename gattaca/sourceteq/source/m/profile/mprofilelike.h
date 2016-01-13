#import "appdel.h"
#import "mprofilelikeprotocol.h"

@interface mprofilelike:NSObject

-(instancetype)init:(NSDictionary*)json;
-(NSInteger)count;
-(id<mprofilelikeprotocol>)item:(NSInteger)index;
-(void)update:(id<mprofilelikeprotocol>)like amount:(NSInteger)newamount;

@end