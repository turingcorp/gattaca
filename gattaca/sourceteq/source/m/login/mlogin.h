#import "appdel.h"
#import "mloginprotocol.h"

@interface mlogin:NSObject

+(mlogin*)generate;
-(NSInteger)count;
-(id<mloginprotocol>)step:(NSInteger)index;

@property(nonatomic)NSInteger selected;

@end