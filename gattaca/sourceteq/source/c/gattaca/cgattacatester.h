#import "appdel.h"

@class mgattacatest;
@class vgattacatester;

@interface cgattacatester:UIViewController

-(void)cancel;
-(void)nextstep;

@property(strong, nonatomic)mgattacatest *test;
@property(weak, nonatomic)vgattacatester *viewtester;

@end