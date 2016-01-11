#import "cconfigsettings.h"

@implementation cconfigsettings

-(instancetype)init:(mconfigsettings*)model
{
    self = [super init];
    [self setTitle:NSLocalizedString(@"config_settings_title", nil)];
    
    self.model = model;
    
    return self;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

-(void)loadView
{
    self.view = [[vconfigsettings alloc] init:self];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [[analytics singleton] trackscreen:ga_screen_config_settings];
}

@end