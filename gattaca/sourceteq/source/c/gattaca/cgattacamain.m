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
    return UIStatusBarStyleDefault;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark public

-(void)cancel
{
    [[cmain singleton] dismissViewControllerAnimated:YES completion:
     ^{
         [[NSNotificationCenter defaultCenter] postNotificationName:notprofileupdate object:nil];
     }];
}

-(void)starttest
{
    [[cmain singleton] dismissViewControllerAnimated:NO completion:
     ^{
         [cgattacatester start];
     }];
}

@end