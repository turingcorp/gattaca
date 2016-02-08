#import "mprofilecircleitem.h"

@implementation mprofilecircleitem

-(instancetype)init:(NSInteger)amount
{
    self = [super init];
    
    self.amount = amount;
    
    return self;
}

#pragma mark public

-(UIColor*)color
{
    return [UIColor clearColor];
}

@end