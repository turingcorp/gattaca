#import "cprofile.h"

@implementation cprofile

-(instancetype)init:(mconfigprofile*)model
{
    self = [super init];
    
    self.model = model;
    
    return self;
}

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

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

@end