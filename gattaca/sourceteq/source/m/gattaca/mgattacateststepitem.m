#import "mgattacateststepitem.h"

@implementation mgattacateststepitem

-(instancetype)init:(mgattacateststep*)step url:(NSString*)url index:(NSInteger)index
{
    self = [super init];
    
    self.step = step;
    self.url = url;
    self.index = index;
    
    return self;
}

@end