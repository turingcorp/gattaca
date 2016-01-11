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

@end