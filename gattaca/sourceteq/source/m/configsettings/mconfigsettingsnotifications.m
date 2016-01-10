#import "mconfigsettingsnotifications.h"

@implementation mconfigsettingsnotifications

@synthesize celname;

-(instancetype)init
{
    self = [super init];
    
    celname = @"notifications";
    
    return self;
}

#pragma mark
#pragma mark configsetting

-(Class)celclass
{
    return [vconfigsettingscel class];
}

@end