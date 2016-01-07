#import "clogin.h"

@implementation clogin

+(void)asklogin:(BOOL)_animated
{
    dispatch_async(dispatch_get_main_queue(),
                   ^(void)
                   {
                       [[cmain singleton] presentViewController:[[clogin alloc] init] animated:_animated completion:nil];
                   });
}

-(void)loadView
{
    self.view = [[vlogin alloc] init:self];
}

#pragma mark -
#pragma mark login button del

-(void)loginButton:(FBSDKLoginButton*)button didCompleteWithResult:(FBSDKLoginManagerLoginResult*)result error:(NSError*)error
{
    if(error)
    {
        NSLog(@"error %@", error);
    }
    else
    {
        if(result.isCancelled)
        {
            NSLog(@"login cancelled");
        }
        else
        {
            NSLog(@"Granted %@", result.grantedPermissions);
            NSLog(@"Declined %@", result.declinedPermissions);
        }
    }
}

@end