#import "appdel.h"
#import "mconfigprofile.h"
#import "mconfigprotocol.h"

@interface mconfig:NSObject

+(mconfig*)generate;
-(NSInteger)count;
-(id<mconfigprotocol>)item:(NSInteger)item;

@end