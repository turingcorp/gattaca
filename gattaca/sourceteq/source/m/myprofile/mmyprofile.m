#import "mmyprofile.h"

@implementation mmyprofile

+(instancetype)singleton
{
    static mmyprofile *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super init];
    
    return self;
}

#pragma mark functionality

-(void)loaduser
{
    
}

-(void)firsttime
{
    
}

@end