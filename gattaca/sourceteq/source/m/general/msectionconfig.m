#import "msectionconfig.h"

@implementation msectionconfig

#pragma mark public

-(appsection)section
{
    return appsectionconfig;
}

-(UIViewController*)controller
{
    return [[cconfig alloc] init];
}

@end