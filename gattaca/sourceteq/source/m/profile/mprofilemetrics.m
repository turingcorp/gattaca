#import "mprofilemetrics.h"

@implementation mprofilemetrics
{
    NSArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSArray arrayWithObjects:
             [],
             nil];
    
    return self;
}

#pragma mark public

-(NSInteger)count
{
    return array.count;
}

-(id<mprofilemetricprotocol>)metric:(NSInteger)index
{
    return array[index];
}

@end