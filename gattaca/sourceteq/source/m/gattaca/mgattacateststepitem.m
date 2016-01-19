#import "mgattacateststepitem.h"

@implementation mgattacateststepitem

-(instancetype)init:(NSString*)url index:(NSInteger)index
{
    self = [super init];
    
    self.url = url;
    self.index = index;
    
    return self;
}

@end