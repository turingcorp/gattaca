#import "mconfig.h"

@implementation mconfig
{
    NSArray *array;
}

+(mconfig*)generate
{
    return [[mconfig alloc] init];
}

-(instancetype)init
{
    self = [super init];
 
    array = [NSArray arrayWithObjects:
             [[mconfigsettings alloc] init],
             nil];
    
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