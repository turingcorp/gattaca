#import "appdel.h"

@interface mgattacascoreitem:NSObject

-(instancetype)init:(test_step)type index:(NSInteger)index;
-(void)add;
-(void)computefor:(NSInteger)total;

@property(nonatomic)test_step type;
@property(nonatomic)NSInteger index;
@property(nonatomic)NSInteger counter;

@end