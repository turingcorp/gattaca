#import "mconfig.h"

@implementation mconfig
{
    NSArray *array;
}

+(mconfig*)generate
{
    mconfig *config = [[mconfig alloc] init];
    
    return config;
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

-(id<mconfigprotocol>)item:(NSInteger)item
{
    return array[item];
}

@end