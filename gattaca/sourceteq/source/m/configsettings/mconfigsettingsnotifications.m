#import "mconfigsettingsnotifications.h"

@implementation mconfigsettingsnotifications

#pragma mark -
#pragma mark configsetting

-(Class)celclass
{
    return [vconfigsettingsswitch class];
}

-(NSString*)celname
{
    return @"notifications";
}

-(NSString*)title
{
    return NSLocalizedString(@"config_settings_notifications_title", nil);
}

-(BOOL)value
{
    return YES;
}

-(void)change:(BOOL)newvalue
{
    ga_action action = ga_action_off;
    
    if(newvalue)
    {
        action = ga_action_on;
    }
    
    [[analytics singleton] trackevent:ga_event_config_noti action:action label:nil];
}

@end