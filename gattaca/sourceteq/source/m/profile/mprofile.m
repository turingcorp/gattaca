#import "mprofile.h"

@implementation mprofile

+(void)restartprofile
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^(void)
                   {
                       
                   });
}

-(instancetype)init
{
    self = [super init];
    
    self.like = [[mprofilelike alloc] init];
    self.ground = [[mprofileground alloc] init];
    
    return self;
}

-(instancetype)init:(NSDictionary*)json
{
    self = [super init];
    
    return self;
}

@end