#import "mconfigsettingsreview.h"

@implementation mconfigsettingsreview

#pragma mark -
#pragma mark configsetting

-(Class)celclass
{
    return [vconfigsettingsbutton class];
}

-(NSString*)celname
{
    return @"review";
}

-(NSString*)title
{
    return NSLocalizedString(@"config_settings_review_title", nil);
}

-(void)activate
{
    [[analytics singleton] trackevent:ga_event_apprate action:ga_action_start label:nil];
    [tools rateapp];
}

@end