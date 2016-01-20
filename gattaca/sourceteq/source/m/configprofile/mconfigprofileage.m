#import "mconfigprofileage.h"

@implementation mconfigprofileage

#pragma mark -
#pragma mark profile protocol

-(NSString*)title
{
    return NSLocalizedString(@"config_profile_age_title", nil);
}

-(NSString*)value
{
    return [NSString stringWithFormat:@"%@", @([mmyprofile singleton].profile.age)];
}

-(void)change
{
    [cprofileage askage];
}

@end