#import "appdel.h"

@class mgattacatest;

@interface cgattacaend:UIViewController

+(void)finish:(mgattacatest*)test;
-(void)cancel;

@property(strong, nonatomic)mgattacatest *test;

@end