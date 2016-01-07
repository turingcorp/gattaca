#import "mlogin.h"

@implementation mlogin
{
    NSArray *array;
}

+(mlogin*)generate
{
    return [[mlogin alloc] init];
}

-(instancetype)init
{
    self = [super init];
    
    self.selected = 0;
    array = [[NSArray alloc] initWithObjects:
             [[mloginfirst alloc] init],
             [[mloginsecond alloc] init],
             [[mloginthird alloc] init],
             nil];
    
    return self;
}

#pragma mark functionality

#pragma mark public

-(NSInteger)count
{
    return array.count;
}

-(id<mloginprotocol>)step:(NSInteger)index
{
    self.selected = index;
    
    return array[index];
}

@end