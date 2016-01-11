#import "appdel.h"
#import "mprofilemetricprotocol.h"

@interface mprofilemetrics:NSObject

-(void)loadlocal;
-(void)loadjson:(NSDictionary*)json;
-(NSInteger)count;
-(id<mprofilemetricprotocol>)metric:(NSInteger)index;
-(void)add:(id<mprofilemetricprotocol>)metric;

@end