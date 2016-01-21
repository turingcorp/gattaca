#import "cgattacatester.h"

@implementation cgattacatester

-(instancetype)init:(cgattaca*)parent
{
    self = [super init];

    self.parent = parent;
    [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    self.test = [mgattacatest test];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:NSLocalizedString(@"gattaca_main_title", nil)];
    
    [[analytics singleton] trackscreen:ga_screen_gattaca_test];
}

-(void)loadView
{
    self.view = [[vgattacatester alloc] init:self];
    self.viewtester = (vgattacatester*)self.view;
    
    [self showcurrent];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark functionality

-(void)showcurrent
{
    [self.viewtester load:[self.test current]];
}

#pragma mark public

-(void)stop
{
    [[analytics singleton] trackevent:ga_event_gattaca_test action:ga_action_stopped label:nil];
    [[cmain singleton] dismissViewControllerAnimated:YES completion:nil];
}

-(void)nextstep
{
    if(self.test.hasnext)
    {
        [self showcurrent];
    }
    else
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                       ^
                       {
                           [self.test renderscore];
                       });
        
        [self.parent setViewControllers:@[[[cgattacaend alloc] init:self.parent]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    }
}

@end