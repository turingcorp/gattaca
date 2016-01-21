#import "cgattacamain.h"

@implementation cgattacamain

-(instancetype)init:(cgattaca*)parent
{
    self = [super init];
    
    self.parent = parent;
    [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    
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
    self.view = [[vgattaca alloc] init:self];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark public

-(void)cancel
{
    [[analytics singleton] trackevent:ga_event_gattaca_test action:ga_action_cancelled label:nil];
    [[cmain singleton] dismissViewControllerAnimated:YES completion:nil];
}

-(void)starttest
{
    [[analytics singleton] trackevent:ga_event_gattaca_test action:ga_action_start label:nil];
    [self.parent setViewControllers:@[[[cgattacatester alloc] init:self.parent]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

@end