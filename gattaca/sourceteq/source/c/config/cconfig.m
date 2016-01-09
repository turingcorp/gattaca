#import "cconfig.h"

@implementation cconfig

-(instancetype)init
{
    self = [super initWithRootViewController:[[cconfigmain alloc] init]];
    [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    [self setNavigationBarHidden:YES];
    
    return self;
}

@end