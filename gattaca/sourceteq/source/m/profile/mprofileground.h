#import "appdel.h"
#import "mprofilegroundprotocol.h"

@interface mprofileground:NSObject

-(instancetype)init:(NSDictionary*)json;
-(NSInteger)count;
-(id<mprofilegroundprotocol>)item:(NSInteger)index;
-(void)update:(id<mprofilegroundprotocol>)like amount:(NSInteger)newamount;
-(id<mprofilegroundprotocol>)like:(profile_ground)like;

@end