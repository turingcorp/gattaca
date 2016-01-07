#import "msession.h"

@implementation msession

+(instancetype)singleton
{
    static msession *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super init];
    
    if([FBSDKAccessToken currentAccessToken])
    {
        
    }
    
    return self;
}

@end