#import "appdel.h"

@class mgattacateststep;
@class mgattacateststepitem;
@class mgattacascore;

@interface mgattacatest:NSObject

+(instancetype)test;
-(NSInteger)count;
-(mgattacateststep*)step:(NSInteger)item;
-(mgattacateststep*)current;
-(BOOL)next;
-(void)chooseitem:(mgattacateststepitem*)item;
-(void)renderscore;

@property(strong, nonatomic)mgattacascore *score;
@property(nonatomic)NSInteger currentitem;

@end