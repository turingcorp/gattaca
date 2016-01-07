#import "appdel.h"

@implementation appdel
{
    UIWindow *window;
}

-(BOOL)application:(UIApplication*)app didFinishLaunchingWithOptions:(NSDictionary*)options
{
    [updater launch];
    window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [window makeKeyAndVisible];
    
    [[FBSDKApplicationDelegate sharedInstance] application:app didFinishLaunchingWithOptions:options];
    [window setRootViewController:[cmain singleton]];
    [[analytics singleton] start];
    
    return YES;
}

-(BOOL)application:(UIApplication*)app openURL:(NSURL*)url sourceApplication:(NSString*)source annotation:(id)ann
{
    return [[FBSDKApplicationDelegate sharedInstance] application:app openURL:url sourceApplication:source annotation:ann];
}

-(void)applicationWillResignActive:(UIApplication*)app
{
}

-(void)applicationDidEnterBackground:(UIApplication*)app
{
}

-(void)applicationWillEnterForeground:(UIApplication*)app
{
}

-(void)applicationDidBecomeActive:(UIApplication*)app
{
    [FBSDKAppEvents activateApp];
}

-(void)applicationWillTerminate:(UIApplication*)app
{
}

@end