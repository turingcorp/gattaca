#import "msectionbrowse.h"

@implementation msectionbrowse

#pragma mark -
#pragma mark section protocol

-(appsection)section
{
    return appsectionbrowse;
}

-(UIViewController*)controller
{
    return [[cbrowse alloc] init];
}

-(NSString*)image
{
    return @"loader";
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