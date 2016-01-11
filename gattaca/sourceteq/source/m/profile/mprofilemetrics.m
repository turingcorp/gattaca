#import "mprofilemetrics.h"

@implementation mprofilemetrics
{
    NSMutableArray *array;
}

#pragma mark public

-(void)loadlocal
{
    array = [NSMutableArray array];
    
    CGFloat test = 1 / 4.0;
    
    [self add:[[mprofilemetricscience alloc] init:test]];
    [self add:[[mprofilemetricart alloc] init:test]];
    [self add:[[mprofilemetricsport alloc] init:test]];
    [self add:[[mprofilemetricsocial alloc] init:test]];
}

-(void)loadjson:(NSDictionary*)json
{
    
}

-(NSInteger)count
{
    return array.count;
}

-(id<mprofilemetricprotocol>)metric:(NSInteger)index
{
    return array[index];
}

-(void)add:(id<mprofilemetricprotocol>)metric
{
    [array addObject:metric];
}

@end