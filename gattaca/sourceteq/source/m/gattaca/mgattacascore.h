#import "appdel.h"

@class mgattacascoreitem;

@interface mgattacascore:NSObject

+(instancetype)scorefor:(test_step)type;
-(void)addto:(NSInteger)index;
-(void)measure;

@property(nonatomic)test_step type;
@property(nonatomic)NSInteger count;

@end