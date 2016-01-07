#import "appdel.h"
#import "mgeneral.h"

@interface analytics:NSObject

+(instancetype)singleton;
-(void)start;
-(void)trackscreen:(ga_screen)screen;
-(void)trackevent:(ga_event)event action:(ga_action)action;
-(void)trackevent:(ga_event)event openaction:(NSString*)openaction;

@property(weak, nonatomic)id<GAITracker> tracker;

@end