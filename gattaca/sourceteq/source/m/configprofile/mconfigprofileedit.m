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
    return @"";
}

-(void)change
{
    
}

@end