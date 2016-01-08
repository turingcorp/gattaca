#import "mprofile.h"

@implementation mprofile

+(instancetype)singleton
{
    static mprofile *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

#pragma mark public

-(BOOL)completed
{
    return NO;
}

@end