#import "appdel.h"

@class cgattaca;

@interface cgattacamain:UIViewController

-(instancetype)init:(cgattaca*)parent;
-(void)cancel;
-(void)starttest;

@property(weak, nonatomic)cgattaca *parent;

@end