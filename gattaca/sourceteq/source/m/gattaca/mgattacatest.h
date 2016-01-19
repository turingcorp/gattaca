#import "appdel.h"

@class mgattacateststep;

@interface mgattacatest:NSObject

+(instancetype)test;
-(NSInteger)count;
-(mgattacateststep*)step:(NSInteger)item;

@property(nonatomic)NSInteger current;

@end