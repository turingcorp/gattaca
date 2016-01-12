#import "cloading.h"

@implementation cloading
{
    FBSDKGraphRequest *request;
}

-(instancetype)init
{
    self = [super init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedloadingfinished:) name:notloadfinish object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)loadView
{
    self.view = [[vloading alloc] init];
}

#pragma mark notifications

-(void)notifiedloadingfinished:(NSNotification*)notification
{
    if([msession singleton].userid)
    {
        //[[cmain singleton] opensection:[msection browse] animated:NO];
        
        dispatch_async(dispatch_get_main_queue(),
                       ^(void)
                       {
                           if ([[FBSDKAccessToken currentAccessToken] hasGranted:@"user_about_me"]) {
                               // TODO: publish content.
                           } else {
                               FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
                               [loginManager logInWithReadPermissions:@[@"user_about_me"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                   NSLog(@"%@", error);
                               }];
                           }
                           
                           [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields":@"birthday"}] startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                               NSLog(@"%@", error);
                               NSLog(@"res: %@", result);
                           }];
                       });
    }
    else
    {
        [clogin asklogin:NO];
    }
}

@end