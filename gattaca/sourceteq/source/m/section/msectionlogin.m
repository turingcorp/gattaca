#import "msectionlogin.h"

@implementation msectionlogin

#pragma mark -
#pragma mark section protocol

-(appsection)section
{
    return appsectionlogin;
}

-(UIViewController*)controller
{
    return [[clogin alloc] init];
}

@end