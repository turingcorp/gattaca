#import "cgattacatester.h"

@implementation cgattacatester

-(instancetype)init
{
    self = [super init];
    
    [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    self.test = [mgattacatest test];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:NSLocalizedString(@"gattaca_main_title", nil)];
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
    [[analytics singleton] trackevent:ga_event_gattaca_test action:ga_action_stopped label:@""];
    [[cmain singleton] dismissViewControllerAnimated:YES completion:nil];
}

-(void)nextstep
{
    if([self.test next])
    {
        [self showcurrent];
    }
    else
    {
        [[cmain singleton] dismissViewControllerAnimated:NO completion:
         ^{
             [cgattacaend finish:self.test];
         }];
    }
}

@end