#import "appdel.h"

@interface analytics:NSObject

+(instancetype)singleton;
-(void)start;
-(void)trackscreen:(ga_screen)screen;
-(void)trackevent:(ga_event)event action:(ga_action)action;

@end