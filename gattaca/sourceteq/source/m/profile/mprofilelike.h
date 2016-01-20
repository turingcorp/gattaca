#import "appdel.h"
#import "mprofilelikeprotocol.h"

@interface mprofilelike:NSObject

-(instancetype)init:(NSDictionary*)json;
-(NSInteger)count;
-(id<mprofilelikeprotocol>)item:(NSInteger)index;
-(void)updatetype:(profile_like)type amount:(NSInteger)amount;
-(id<mprofilelikeprotocol>)like:(profile_like)like;

@end