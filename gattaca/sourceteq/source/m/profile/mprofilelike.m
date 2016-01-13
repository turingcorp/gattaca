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
        id<mprofilelikeprotocol> item;
        
        switch(liketype)
        {
            case profile_like_science:
                
                item = [[mprofilelikescience alloc] init:amount];
                
                break;
                
            case profile_like_art:
                
                item = [[mprofilelikeart alloc] init:amount];
                
                break;
                
            case profile_like_social:
                
                item = [[mprofilelikesocial alloc] init:amount];
                
                break;
                
            case profile_like_sport:
                
                item = [[mprofilelikescience alloc] init:amount];
                
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
    [like newamount:newamount];
    
    NSString *query = [NSString stringWithFormat:
                       @"UPDATE profilelike set amount=%@ where liketype=%@;",
                       @([like type]), @(newamount)];
    [db query:query];
}

@end