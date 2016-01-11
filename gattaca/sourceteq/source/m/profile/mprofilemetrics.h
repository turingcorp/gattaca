#import "appdel.h"

@interface mprofilemetrics:NSObject

-(NSInteger)count;
-(id<mprofilemetricprotocol>)metric:(NSInteger)index;

@end