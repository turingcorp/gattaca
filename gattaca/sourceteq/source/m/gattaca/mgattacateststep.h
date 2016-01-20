#import "appdel.h"

@class mgattacatest;
@class mgattacateststepitem;

@interface mgattacateststep:NSObject

+(instancetype)parse:(NSDictionary*)dictionary test:(mgattacatest*)test;
-(NSInteger)count;
-(mgattacateststepitem*)item:(NSInteger)item;

@property(weak, nonatomic)mgattacatest *test;

@end