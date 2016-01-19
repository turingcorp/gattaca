#import "mgattacateststep.h"

@implementation mgattacateststep
{
    NSMutableArray *array;
}

+(instancetype)parse:(NSDictionary*)dictionary
{
    mgattacateststep *step = [[mgattacateststep alloc] init];
    
    
    
    return step;
}

-(instancetype)init
{
    self = [super init];
    
    return self;
}

#pragma mark public

-(NSInteger)count
{
    return array.count;
}

-(mgattacateststepitem*)item:(NSInteger)item;
{
    return array[item];
}

@end