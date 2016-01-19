#import "appdel.h"

@class mgattacateststep;

@interface mgattacatest:NSObject

+(instancetype)test;
-(NSInteger)count;
-(mgattacateststep*)step:(NSInteger)item;
-(mgattacateststep*)current;
-(BOOL)next;

@property(nonatomic)NSInteger currentitem;

@end