#import "clogin.h"

@implementation clogin

+(void)asklogin:(BOOL)_animated
{
    dispatch_async(dispatch_get_main_queue(),
                   ^(void)
                   {
                       [[cmain singleton] opensection:[msection login] animated:_animated];
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
    self.view = [[vlogin alloc] init:self];
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
        [[analytics singleton] trackevent:ga_event_login action:ga_action_error label:error.localizedDescription];
        NSLog(@"error %@", error);
        
        [calert show];
    }
    else
    {
        if(result.isCancelled)
        {
            [[analytics singleton] trackevent:ga_event_login action:ga_action_cancelled label:@""];
            NSLog(@"login cancelled");
        }
        else
        {
            [[analytics singleton] trackevent:ga_event_login action:ga_action_done label:@""];
        }
    }
}

-(void)loginButtonDidLogOut:(FBSDKLoginButton*)button
{
    
}

@end