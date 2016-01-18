#import "cgattaca.h"

@implementation cgattaca

-(instancetype)init
{
    self = [super init];
    
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:NSLocalizedString(@"gattaca_main_title", nil)];
    
    [[analytics singleton] trackscreen:ga_screen_gattaca_main];
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