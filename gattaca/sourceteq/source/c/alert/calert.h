#import "appdel.h"

@interface calert:UIViewController

+(void)show:(NSString*)message;
-(void)accept;

@property(copy, nonatomic)NSString *message;

@end