#import "cprofile.h"

@implementation cprofile

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:NSLocalizedString(@"config_profile_title", nil)];
    
    [[analytics singleton] trackscreen:ga_screen_profile];
}

-(void)loadView
{
    self.view = [[vconfigprofile alloc] init:self];
}

@end