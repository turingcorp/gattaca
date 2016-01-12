#import "cconfigprofile.h"

@implementation cconfigprofile

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:NSLocalizedString(@"config_profile_title", nil)];
    
    [[analytics singleton] trackscreen:ga_screen_config_profile];
}

-(void)loadView
{
    self.view = [[vconfigprofile alloc] init:self];
}

@end