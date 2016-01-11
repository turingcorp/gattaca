#import "cconfigsettingslogout.h"

@implementation cconfigsettingslogout

+(void)askconfirmation
{
    dispatch_async(dispatch_get_main_queue(),
                   ^(void)
                   {
                       [[cmain singleton] presentViewController:[[cconfigsettingslogout alloc] init] animated:YES completion:nil];
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
    self.view = [[vconfigsettingslogout alloc] init:self];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [[analytics singleton] trackscreen:ga_screen_logout];
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

#pragma mark -
#pragma mark facebook del

-(BOOL)loginButtonWillLogin:(FBSDKLoginButton*)button
{
    [[analytics singleton] trackevent:ga_event_logout action:ga_action_start label:@""];
    
    return YES;
}

-(void)loginButton:(FBSDKLoginButton*)button didCompleteWithResult:(FBSDKLoginManagerLoginResult*)result error:(NSError*)error
{
}

-(void)loginButtonDidLogOut:(FBSDKLoginButton*)button
{
    [[analytics singleton] trackevent:ga_event_logout action:ga_action_done label:@""];
    
    dispatch_async(dispatch_get_main_queue(),
                   ^(void)
                   {
                       [self cancel];
                   });
}

@end