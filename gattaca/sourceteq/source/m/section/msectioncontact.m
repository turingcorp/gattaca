#import "msectioncontact.h"

@implementation msectioncontact

#pragma mark -
#pragma mark section protocol

-(appsection)section
{
    return appsectioncontact;
}

-(UIViewController*)controller
{
    return [[ccontact alloc] init];
}

-(NSString*)image
{
    return @"contact";
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