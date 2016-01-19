#import "mgattacascoreitem.h"

@implementation mgattacascoreitem

-(instancetype)init:(test_step)type index:(NSInteger)index
{
    self = [super init];
    
    self.type = type;
    self.index = index;
    self.counter = 0;
    
    return self;
}

@end