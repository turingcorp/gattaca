#import "analytics.h"

@implementation analytics
{
    NSArray *screens;
    NSArray *events;
    NSArray *actions;
}

+(instancetype)singleton
{
    static analytics *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super init];
    
    NSDictionary *plist = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"analytics" withExtension:@"plist"]];
    screens = plist[@"screens"];
    events = plist[@"events"];
    actions = plist[@"actions"];
    
    return self;
}

#pragma mark public

-(void)start
{
    [[GAI sharedInstance] trackerWithTrackingId:analyticsid];
}

-(void)trackscreen:(ga_screen)screen
{
    
}

-(void)trackevent:(ga_event)event action:(ga_action)action
{
    
}

//+(void)session
//{
//    [[GAI sharedInstance] trackerWithTrackingId:analyticsid];
//    [GAI sharedInstance].trackUncaughtExceptions = YES;
//    [GAI sharedInstance].dispatchInterval = 5;
//    [[GAI sharedInstance].logger setLogLevel:kGAILogLevelNone];
//}
//
//+(void)screen:(screen)_screen
//{
//    NSString *screenname = [analytics screenname:_screen];
//    [[[GAI sharedInstance] defaultTracker] send:[[[GAIDictionaryBuilder createScreenView] set:screenname forKey:kGAIScreenName] build]];
//}
//
//+(void)event:(event)_event action:(NSString*)_action
//{
//    NSString *eventname = [analytics eventname:_event];
//    [[[GAI sharedInstance] defaultTracker] send:[[GAIDictionaryBuilder createEventWithCategory:eventname action:_action label:eventname value:@1] build]];
//}
//
//#pragma mark private
//
//+(NSString*)screenname:(screen)_screen
//{
//    NSString *name;
//    
//    switch(_screen)
//    {
//        case screen_game:
//            
//            name = @"game";
//            
//            break;
//            
//        case screen_home:
//            
//            name = @"home";
//            
//            break;
//            
//        case screen_masters:
//            
//            name = @"masters";
//            
//            break;
//            
//        case screen_settings:
//            
//            name = @"settings";
//            
//            break;
//            
//        case screen_tutorial:
//            
//            name = @"tutorial";
//            
//            break;
//    }
//    
//    return name;
//}
//
//+(NSString*)eventname:(event)_event
//{
//    NSString *name;
//    
//    switch(_event)
//    {
//        case event_banners:
//            
//            name = @"banners";
//            
//            break;
//            
//        case event_publish:
//            
//            name = @"publish";
//            
//            break;
//            
//        case event_rate:
//            
//            name = @"rate";
//            
//            break;
//    }
//    
//    return name;
//}

@end