#import "cconfig.h"

@implementation cconfig

-(instancetype)init
{
    self = [super initWithRootViewController:[[cconfigmain alloc] init]];

    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationBar setTintColor:colormain];
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:fontboldname size:16], NSForegroundColorAttributeName:[UIColor blackColor]}];
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