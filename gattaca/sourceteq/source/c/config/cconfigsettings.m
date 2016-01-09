#import "cconfigsettings.h"

@implementation cconfigsettings

-(instancetype)init:(mconfigsettings*)model
{
    self = [super init];
    [self setTitle:NSLocalizedString(@"config_settings_title", nil)];
    
    self.model = model;
    
    return self;
}

-(void)loadView
{
    self.view = [[vconfigsettings alloc] init:self];
}

@end