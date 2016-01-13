#import "appdel.h"
#import "mprofilegroundprotocol.h"

@interface mprofileground:NSObject

-(instancetype)init:(NSDictionary*)json;
-(NSInteger)count;
-(id<mprofilegroundprotocol>)item:(NSInteger)index;
-(void)update:(id<mprofilegroundprotocol>)ground amount:(NSInteger)newamount;

@end