#import "msectionconfig.h"

@implementation msectionconfig

#pragma mark -
#pragma mark section protocol

-(appsection)section
{
    return appsectionconfig;
}

-(UIViewController*)controller
{
    return [[cconfig alloc] init];
}

-(NSString*)image
{
    return @"engine";
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