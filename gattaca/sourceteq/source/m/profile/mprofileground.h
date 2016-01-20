#import "appdel.h"
#import "mprofilegroundprotocol.h"

@interface mprofileground:NSObject

-(instancetype)init:(NSDictionary*)json;
-(NSInteger)count;
-(id<mprofilegroundprotocol>)item:(NSInteger)index;
//-(id<mprofilegroundprotocol>)ground:(profile_ground)like;
//-(void)updatetype:(profile_ground)type amount:(NSInteger)amount;

@end