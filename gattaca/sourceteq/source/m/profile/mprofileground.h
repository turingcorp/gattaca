#import "appdel.h"
#import "mprofilegroundprotocol.h"

@interface mprofileground:NSObject

-(instancetype)init:(NSDictionary*)json;
-(NSInteger)count;
-(id<mprofilegroundprotocol>)item:(NSInteger)index;

@end