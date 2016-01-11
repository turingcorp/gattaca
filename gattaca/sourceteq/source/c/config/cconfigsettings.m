#import "cconfigsettings.h"

@implementation cconfigsettings

-(instancetype)init:(mconfigsettings*)model
{
    self = [super init];
    [self setTitle:NSLocalizedString(@"config_settings_title", nil)];
    
    self.model = model;
    
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[(vconfigsettings*)self.view collection] reloadData];
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

@end