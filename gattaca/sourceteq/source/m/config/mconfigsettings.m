#import "mconfigsettings.h"

@implementation mconfigsettings

#pragma mark -
#pragma mark config protocol

-(UIViewController*)controller
{
    return [[cconfigsettings alloc] init];
}

-(NSString*)title
{
    return NSLocalizedString(@"config_settings_title", nil);
}

-(NSString*)descr
{
    return NSLocalizedString(@"config_settings_descr", nil);
}

-(NSString*)image
{
    return @"";
}

-(UIColor*)color
{
    return [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
}

@end