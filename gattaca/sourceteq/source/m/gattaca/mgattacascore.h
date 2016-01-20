#import "appdel.h"

@class mgattacascoreitem;

@interface mgattacascore:NSObject

+(instancetype)scorefor:(test_step)type;
-(mgattacascoreitem*)likeitem:(profile_like)type;
-(mgattacascoreitem*)grounditem:(profile_ground)type;
-(void)addtolike:(profile_like)type;
-(void)addtoground:(profile_ground)type;

@end