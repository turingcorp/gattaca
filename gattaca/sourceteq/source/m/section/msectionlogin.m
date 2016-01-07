#import "msectionlogin.h"

@implementation msectionlogin

#pragma mark public

-(appsection)section
{
    return appsectionlogin;
}

-(UIViewController*)controller
{
    return [[clogin alloc] init];
}

@end