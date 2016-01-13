#import "mprofilelike.h"

@implementation mprofilelike
{
    NSMutableArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSMutableArray array];
    [self loadfromdb];
    
    return self;
}

-(instancetype)init:(NSDictionary*)json
{
    self = [super init];
    
    array = [NSMutableArray array];
    
    return self;
}

#pragma mark functionality

-(void)loadfromdb
{
    NSString *query = @"SELECT liketype, amount FROM profilelike ORDER BY liketype ASC;";
    NSArray *rows = [db rows:query];
    NSInteger count = rows.count;
    
    for(NSInteger i = 0; i < count; i++)
    {
        NSDictionary *
    }
}

#pragma mark public

-(NSInteger)count
{
    return array.count;
}

-(id<mprofilelikeprotocol>)item:(NSInteger)index
{
    return array[index];
}

@end