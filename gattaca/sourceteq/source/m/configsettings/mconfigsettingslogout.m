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

@end