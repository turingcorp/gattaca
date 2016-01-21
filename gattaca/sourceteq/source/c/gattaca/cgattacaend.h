#import "appdel.h"

@class cgattaca;

@interface cgattacaend:UIViewController

-(instancetype)init:(cgattaca*)parent;
-(void)accept;

@property(weak, nonatomic)cgattaca *parent;

@end