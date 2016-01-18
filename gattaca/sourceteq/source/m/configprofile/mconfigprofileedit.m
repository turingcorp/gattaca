#import "mconfigprofileedit.h"

@implementation mconfigprofileedit

#pragma mark -
#pragma mark profile protocol

-(NSString*)title
{
    return NSLocalizedString(@"config_profile_edit_title", nil);
}

-(NSString*)value
{
    return NSLocalizedString(@"config_profile_edit_descr", nil);
}

-(void)change
{
    [cgattaca test];
}

@end