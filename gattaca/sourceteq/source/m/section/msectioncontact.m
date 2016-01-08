#import "msectioncontact.h"

@implementation msectioncontact

#pragma mark public

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