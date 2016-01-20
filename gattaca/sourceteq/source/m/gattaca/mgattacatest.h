#import "appdel.h"

@class mgattacateststep;
@class mgattacateststepitem;
@class mgattacascore;

@interface mgattacatest:NSObject

+(instancetype)test;
-(NSInteger)count;
-(mgattacateststep*)step:(NSInteger)item;
-(mgattacateststep*)current;
-(void)chooseitem:(mgattacateststepitem*)item;
-(void)next;
-(void)renderscore;

@property(strong, nonatomic)mprofilecircle *circle;
@property(nonatomic)NSInteger currentitem;
@property(nonatomic)BOOL hasnext;

@end