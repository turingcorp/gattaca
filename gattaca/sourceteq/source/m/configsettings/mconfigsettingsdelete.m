#import "mconfigsettingsdelete.h"

@implementation mconfigsettingsdelete

#pragma mark -
#pragma mark configsetting

-(Class)celclass
{
    return [vconfigsettingsbutton class];
}

-(NSString*)celname
{
    return @"delete";
}

@end