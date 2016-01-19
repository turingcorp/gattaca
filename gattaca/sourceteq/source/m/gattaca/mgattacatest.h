#import "appdel.h"

@class mgattacateststep;
@class mprofileground;
@class mprofilelike;

@interface mgattacatest:NSObject

+(instancetype)test;
-(NSInteger)count;
-(mgattacateststep*)step:(NSInteger)item;
-(mgattacateststep*)current;
-(BOOL)next;

@property(strong, nonatomic)mprofilelike *like;
@property(strong, nonatomic)mprofileground *ground;
@property(nonatomic)NSInteger currentitem;

@end