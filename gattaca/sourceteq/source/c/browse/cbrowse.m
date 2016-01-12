#import "cbrowse.h"

@implementation cbrowse

-(instancetype)init
{
    self = [super init];
    
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
    self.view = [[vbrowse alloc] init:self];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [[analytics singleton] trackscreen:ga_screen_browse];
}

#pragma mark public


@end