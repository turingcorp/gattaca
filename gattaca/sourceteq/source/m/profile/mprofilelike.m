#import "mprofilelike.h"

@implementation mprofilelike
{
    NSMutableArray *array;
}

-(instancetype)init
{
    self = [super init];
    
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
    array = [NSMutableArray array];
    NSString *query = @"SELECT liketype, amount FROM profilelike ORDER BY liketype ASC;";
    NSArray *rows = [db rows:query];
    NSInteger count = rows.count;
    
    for(NSInteger i = 0; i < count; i++)
    {
        NSDictionary *raw = rows[i];
        profile_like liketype = (profile_like)[raw[@"liketype"] integerValue];
        NSInteger amount = [raw[@"amount"] integerValue];
        
        switch(liketype)
        {
            case profile_like_science:
                
                [array addObject:[[mprofilelikescience alloc] init]];
                
                break;
                
            case profile_like_art:
                
                break;
                
            case profile_like_social:
                
                break;
                
            case profile_like_sport:
                
                break;
        }
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

-(void)update:(id<mprofilelikeprotocol>)like amount:(NSInteger)newamount
{
    NSString *query = [NSString stringWithFormat:
                       @"UPDATE profilelike set amount=%@ where liketype=%@;",
                       @([like type]), @(newamount)];
    [db query:query];
}

@end