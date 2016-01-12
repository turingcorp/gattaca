#import "mprofile.h"

@implementation mprofile

-(instancetype)init
{
    self = [super init];
    
    self.like = [[mprofilelike alloc] init];
    self.ground = [[mprofileground alloc] init];
    
    return self;
}

@end