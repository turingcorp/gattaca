#import "clogin.h"

@implementation clogin

+(void)asklogin:(BOOL)animated
{
    dispatch_async(dispatch_get_main_queue(),
                   ^(void)
                   {
                       [[cmain singleton] opensection:[msection login] animated:animated];
                   });
}

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
    self.view = [[vlogin alloc] init:self];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [[analytics singleton] trackscreen:ga_screen_login];
}

#pragma mark functionality

-(void)logincomplete
{
    [[cmain singleton] openinitial];
}

#pragma mark -
#pragma mark login button del

-(BOOL)loginButtonWillLogin:(FBSDKLoginButton*)button
{
    [[analytics singleton] trackevent:ga_event_login action:ga_action_start label:@""];
    
    return YES;
}

-(void)loginButton:(FBSDKLoginButton*)button didCompleteWithResult:(FBSDKLoginManagerLoginResult*)result error:(NSError*)error
{
    if(error)
    {
        NSString *errordescr = error.localizedDescription;
        [[analytics singleton] trackevent:ga_event_login action:ga_action_error label:errordescr];
        NSLog(@"%@", errordescr);
        
        [calert show:NSLocalizedString(@"error_login_facebook", nil)];
    }
    else
    {
        if(result.isCancelled)
        {
            [[analytics singleton] trackevent:ga_event_login action:ga_action_cancelled label:@""];
        }
        else
        {
            [[analytics singleton] trackevent:ga_event_login action:ga_action_done label:@""];
            [self logincomplete];
        }
    }
}

-(void)loginButtonDidLogOut:(FBSDKLoginButton*)button
{
}

@end