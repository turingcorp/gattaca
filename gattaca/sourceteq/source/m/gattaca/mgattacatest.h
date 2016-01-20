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

@property(strong, nonatomic)mgattacascore *like;
@property(strong, nonatomic)mgattacascore *ground;
@property(nonatomic)NSInteger currentitem;

@end