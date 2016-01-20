#import "appdel.h"
#import "mprofilecircleprotocol.h"

@interface mprofilecircle:NSObject

+(id<mprofilecircleprotocol>)circle:(profile_circle)type amount:(NSInteger)amount;
-(void)loadfromdb;
-(instancetype)init:(NSDictionary*)json;
-(id<mprofilecircleprotocol>)item:(profile_circle)type;

@end