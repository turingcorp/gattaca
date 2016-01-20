#import "mconfigprofilename.h"

@implementation mconfigprofilename

#pragma mark -
#pragma mark profile protocol

-(NSString*)title
{
    return NSLocalizedString(@"config_profile_name_title", nil);
}

-(NSString*)value
{
    return [mmyprofile singleton].profile.name;
}

-(void)change
{
    [cprofilename askname];
}

@end