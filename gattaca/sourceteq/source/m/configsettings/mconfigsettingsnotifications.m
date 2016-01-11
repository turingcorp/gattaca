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
    return NSLocalizedString(@"", nil);
}

-(BOOL)value
{
#warning "needs revision"
    
    return YES;
}

@end