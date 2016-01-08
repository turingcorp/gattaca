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

-(BOOL)available
{
    return YES;
}

-(BOOL)current
{
    return [[cmain singleton].section section] == [self section];
}

@end