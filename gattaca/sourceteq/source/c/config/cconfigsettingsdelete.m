#import "cconfigsettingsdelete.h"

@implementation cconfigsettingsdelete

+(void)askconfirmation
{
    dispatch_async(dispatch_get_main_queue(),
                   ^(void)
                   {
                       [[cmain singleton] presentViewController:[[cconfigsettingsdelete alloc] init] animated:YES completion:nil];
                   });
}

-(instancetype)init
{
    self = [super init];
    
    [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    
    return self;
}

-(void)loadView
{
    self.view = [[vconfigsettingsdelete alloc] init:self];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [[analytics singleton] trackscreen:ga_screen_delete];
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
    [[cmain singleton] dismissViewControllerAnimated:YES completion:nil];
}

-(void)deleteaccount
{
    [[analytics singleton] trackevent:ga_event_delete action:ga_action_start label:nil];
}

@end