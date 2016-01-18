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
    return @"";
}

-(void)change
{
    
}

@end