#import "mprofileground.h"

@implementation mprofileground
{
    NSMutableDictionary *dictionary;
}

-(instancetype)init
{
    self = [super init];
    
    
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

-(void)update:(id<mprofilegroundprotocol>)ground amount:(NSInteger)newamount
{
    [ground newamount:newamount];
    
    NSString *query = [NSString stringWithFormat:
                       @"UPDATE profileground set amount=%@ where groundtype=%@;",
                       @([ground type]), @(newamount)];
    [db query:query];
}

@end