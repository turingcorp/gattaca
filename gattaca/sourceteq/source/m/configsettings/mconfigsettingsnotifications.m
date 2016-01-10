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

@end