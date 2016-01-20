#import "appdel.h"

@class mgattacatest;
@class mgattacateststeptitle;
@class mgattacateststepitem;

@interface mgattacateststep:NSObject

+(instancetype)parse:(NSDictionary*)dictionary test:(mgattacatest*)test;
-(NSInteger)count;
-(mgattacateststepitem*)item:(NSInteger)item;

@property(weak, nonatomic)mgattacatest *test;
@property(strong, nonatomic)mgattacateststeptitle *title;
@property(nonatomic)test_step steptype;

@end