#import "cconfigsettings.h"

@implementation cconfigsettings

-(instancetype)init
{
    self = [super init];
    [self setTitle:NSLocalizedString(@"config_settings_title", nil)];
    
    return self;
}

-(void)loadView
{
    self.view = [[vconfigsettings alloc] init:self];
}

@end