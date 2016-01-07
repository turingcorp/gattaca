#import "msectionbrowse.h"

@implementation msectionbrowse

#pragma mark public

-(appsection)section
{
    return appsectionbrowse;
}

-(UIViewController*)controller
{
    return [[cbrowse alloc] init];
}

@end