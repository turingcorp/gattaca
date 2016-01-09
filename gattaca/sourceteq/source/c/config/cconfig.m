#import "cconfig.h"

@implementation cconfig

-(instancetype)init
{
    self = [super initWithRootViewController:[[cconfigmain alloc] init]];
    [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    
    return self;
}

@end