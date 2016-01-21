#import "cgattacaend.h"

@implementation cgattacaend

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
    
    [[analytics singleton] trackscreen:ga_screen_gattaca_congrats];
}

-(void)loadView
{
    self.view = [[vgattacaend alloc] init:self];
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

-(void)accept
{
    [[analytics singleton] trackevent:ga_event_gattaca_test action:ga_action_done label:nil];
    [[cmain singleton] dismissViewControllerAnimated:YES completion:
     ^
     {
         [[NSNotificationCenter defaultCenter] postNotificationName:notprofileupdate object:nil];
     }];
}

@end