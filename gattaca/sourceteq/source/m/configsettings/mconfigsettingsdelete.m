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

-(NSString*)title
{
    return NSLocalizedString(@"config_settings_delete_title", nil);
}

-(void)activate
{
    [cconfigsettingsdelete askconfirmation];
}

@end