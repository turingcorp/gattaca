#import "appdel.h"

@class mgattacatest;
@class vgattacatester;
@class cgattaca;

@interface cgattacatester:UIViewController

-(instancetype)init:(cgattaca*)parent;
-(void)stop;
-(void)nextstep;

@property(weak, nonatomic)cgattaca *parent;
@property(strong, nonatomic)mgattacatest *test;
@property(weak, nonatomic)vgattacatester *viewtester;

@end