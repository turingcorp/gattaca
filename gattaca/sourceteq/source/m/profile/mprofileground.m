#import "mprofileground.h"

@implementation mprofileground
{
    NSMutableArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSMutableArray array];
    
    return self;
}

-(instancetype)init:(NSDictionary*)json
{
    self = [super init];
    
    array = [NSMutableArray array];
    
    return self;
}

#pragma mark public

-(NSInteger)count
{
    return array.count;
}

-(id<mprofilegroundprotocol>)item:(NSInteger)index
{
    return array[index];
}

@end