#import "mconfigsettingsnotifications.h"

@implementation mconfigsettingsnotifications

#pragma mark -
#pragma mark configsetting

-(Class)celclass
{
    return [vconfigsettingscel class];
}

-(NSString*)celname
{
    return @"notifications";
}

@end