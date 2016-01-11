#import "mconfigsettingslogout.h"

@implementation mconfigsettingslogout

#pragma mark -
#pragma mark configsetting

-(Class)celclass
{
    return [vconfigsettingsbutton class];
}

-(NSString*)celname
{
    return @"logout";
}

-(NSString*)title
{
    return NSLocalizedString(@"config_settings_logout_title", nil);
}

-(void)change
{
    
}

@end