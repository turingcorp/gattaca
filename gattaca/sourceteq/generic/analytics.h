#import "appdel.h"

@interface analytics:NSObject

+(instancetype)singleton;
+(void)session;
//+(void)screen:(screen)_screen;
//+(void)event:(event)_event action:(NSString*)_action;

@property(strong, nonatomic)NSArray *screens;
@property(strong, nonatomic)NSArray *events;
@property(strong, nonatomic)NSArray *actions;

@end