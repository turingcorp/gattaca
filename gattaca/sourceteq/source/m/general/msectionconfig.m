#import "msectionconfig.h"

@implementation msectionconfig

#pragma mark public

-(NSInteger)index
{
    return 0;
}

-(UIViewController*)controller
{
    return [[cconfig alloc] init];
}

@end