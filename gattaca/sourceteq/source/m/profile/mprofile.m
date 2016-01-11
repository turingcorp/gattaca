#import "mprofile.h"

@implementation mprofile

-(instancetype)init
{
    self = [super init];
    
    self.metrics = [[mprofilemetrics alloc] init];
    
    return self;
}

@end