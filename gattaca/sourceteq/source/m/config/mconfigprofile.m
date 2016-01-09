#import "mconfigprofile.h"

@implementation mconfigprofile

-(UIViewController*)controller
{
    return [[UIViewController alloc] init];
}

-(NSString*)title
{
    return NSLocalizedString(@"config_profile_title", nil);
}

-(NSString*)descr
{
    return NSLocalizedString(@"config_profile_descr", nil);
}

-(NSString*)image
{
    return @"";
}

-(UIColor*)color
{
    return colormain;
}

@end