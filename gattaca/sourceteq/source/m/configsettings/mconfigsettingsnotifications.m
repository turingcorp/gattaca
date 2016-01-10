#import "mconfigsettingsnotifications.h"

@implementation mconfigsettingsnotifications

#pragma mark -
#pragma mark configsetting

-(Class)celclass
{
    return [vconfigsettingscelswitch class];
}

-(NSString*)celname
{
    return @"notifications";
}

@end