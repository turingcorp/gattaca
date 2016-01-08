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

-(BOOL)available
{
    return YES;
}

-(BOOL)current
{
    return [[cmain singleton].section section] == [self section];
}

@end