#import "mconfigbrowsing.h"

@implementation mconfigbrowsing

#pragma mark -
#pragma mark config protocol

-(UIViewController*)controller
{
    return [[UIViewController alloc] init];
}

-(NSString*)title
{
    return NSLocalizedString(@"config_browsing_title", nil);
}

-(NSString*)descr
{
    return NSLocalizedString(@"config_browsing_descr", nil);
}

-(NSString*)image
{
    return @"";
}

-(UIColor*)color
{
    return [UIColor colorWithRed:0.4 green:0.7 blue:0.9 alpha:1];
}

@end