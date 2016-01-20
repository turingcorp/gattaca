#import "appdel.h"

@class mgattacascoreitem;

@interface mgattacascore:NSObject

+(instancetype)scorefor:(test_step)type;
-(void)addto:(test_step)step type:(NSInteger)index;
-(void)measure;

@property(nonatomic)NSInteger count;

@end