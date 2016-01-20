#import "cgattacamain.h"

@implementation cgattacamain

-(instancetype)init
{
    self = [super init];
    
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
    [[analytics singleton] trackevent:ga_event_gattaca_test action:ga_action_cancelled label:@""];
    [[cmain singleton] dismissViewControllerAnimated:YES completion:nil];
}

-(void)starttest
{
    [[analytics singleton] trackevent:ga_event_gattaca_test action:ga_action_start label:@""];
    [self.navigationController pushViewController:[[cgattacatester alloc] init] animated:YES];
}

@end